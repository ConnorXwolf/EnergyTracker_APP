import 'dart:convert';
import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:logger/logger.dart';

import '../../database/database_helper.dart';
import '../../models/exercise.dart';
import '../../utils/date_helpers.dart';

class BackupService {
  final _db = DatabaseHelper.instance;
  final _logger = Logger();

  Future<String> createBackup({bool compress = true}) async {
    try {
      _logger.i('開始創建備份...');

      final backupData = await _collectAllData();
      final jsonData = jsonEncode(backupData);

      final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-');
      final fileName = 'energy_tracker_backup_$timestamp.json';
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/$fileName';

      final file = File(filePath);
      await file.writeAsString(jsonData);

      _logger.i('備份創建成功: $filePath');

      if (compress) {
        return await _compressBackup(filePath);
      }

      return filePath;
    } catch (e) {
      _logger.e('備份失敗: $e');
      throw BackupException('備份創建失敗: $e');
    }
  }

  Future<Map<String, dynamic>> _collectAllData() async {
    final exercises = (await _db.getAllExercises()).map((e) => e.toJson()).toList();
    final tasks = await _db.getAllTasks();

    final today = DateHelpers.getToday();
    final startDate = await _getEarliestDate() ?? '2020-01-01';
    final dates = DateHelpers.getDateRange(startDate, today);

    final exerciseLogs = <Map<String, dynamic>>[];
    final events = <Map<String, dynamic>>[];
    final dailyPoints = <Map<String, dynamic>>[];

    for (final date in dates) {
      final logs = (await _db.getLogsByDate(date)).map((l) => l.toJson()).toList();
      exerciseLogs.addAll(logs);

      final dateEvents = await _db.getEventsByDate(date);
      events.addAll(dateEvents);

      final points = await _db.getDailyPoints(date);
      if (points != null) {
        dailyPoints.add(points);
      }
    }

    return {
      'version': '1.0.0',
      'exported_at': DateTime.now().toIso8601String(),
      'data': {
        'exercises': exercises,
        'exercise_logs': exerciseLogs,
        'tasks': tasks,
        'events': events,
        'daily_points': dailyPoints,
      },
      'metadata': {
        'total_records': exercises.length +
            exerciseLogs.length +
            tasks.length +
            events.length +
            dailyPoints.length,
        'date_range': {
          'start': startDate,
          'end': today,
        },
      },
    };
  }

  Future<String?> _getEarliestDate() async {
    try {
      final db = await _db.database;
      final result = await db.rawQuery('''
        SELECT MIN(date) as earliest FROM (
          SELECT date FROM daily_points
          UNION ALL
          SELECT date FROM exercise_logs
          UNION ALL
          SELECT date FROM tasks
          UNION ALL
          SELECT event_date as date FROM events
        )
      ''');

      if (result.isNotEmpty && result.first['earliest'] != null) {
        return result.first['earliest'] as String;
      }
      return null;
    } catch (e) {
      _logger.w('無法獲取最早日期: $e');
      return null;
    }
  }

  Future<String> _compressBackup(String jsonFilePath) async {
    final jsonFile = File(jsonFilePath);
    final bytes = await jsonFile.readAsBytes();

    final archive = Archive();
    archive.addFile(ArchiveFile('backup.json', bytes.length, bytes));

    final zipEncoder = ZipEncoder();
    final zipBytes = zipEncoder.encode(archive);

    final zipPath = jsonFilePath.replaceAll('.json', '.zip');
    final zipFile = File(zipPath);
    await zipFile.writeAsBytes(zipBytes!);

    await jsonFile.delete();

    _logger.i('備份已壓縮: $zipPath');
    return zipPath;
  }

  Future<void> shareBackup(String backupPath) async {
    try {
      final file = XFile(backupPath);
      await Share.shareXFiles(
        [file],
        subject: 'Energy Tracker 數據備份',
        text: '我的 Energy Tracker 應用數據備份',
      );

      _logger.i('備份已分享');
    } catch (e) {
      _logger.e('分享失敗: $e');
      throw BackupException('分享備份失敗: $e');
    }
  }

  Future<void> importBackup(
    String filePath, {
    ImportStrategy strategy = ImportStrategy.merge,
  }) async {
    try {
      _logger.i('開始導入備份: $filePath');

      String jsonData;
      if (filePath.endsWith('.zip')) {
        jsonData = await _decompressBackup(filePath);
      } else {
        jsonData = await File(filePath).readAsString();
      }

      final backupData = jsonDecode(jsonData) as Map<String, dynamic>;
      final data = backupData['data'] as Map<String, dynamic>;
      await _importData(data, strategy);

      _logger.i('備份導入成功');
    } catch (e) {
      _logger.e('導入失敗: $e');
      throw BackupException('備份導入失敗: $e');
    }
  }

  Future<String> _decompressBackup(String zipPath) async {
    final zipFile = File(zipPath);
    final bytes = await zipFile.readAsBytes();

    final archive = ZipDecoder().decodeBytes(bytes);

    for (final file in archive) {
      if (file.name == 'backup.json') {
        return utf8.decode(file.content as List<int>);
      }
    }

    throw BackupException('備份文件格式錯誤');
  }

  Future<void> _importData(
    Map<String, dynamic> data,
    ImportStrategy strategy,
  ) async {
    switch (strategy) {
      case ImportStrategy.overwrite:
        await _clearAllData();
        await _insertAllData(data);
        break;

      case ImportStrategy.skip:
        await _insertWithSkip(data);
        break;

      case ImportStrategy.merge:
        await _mergeData(data);
        break;
    }
  }

  Future<void> _clearAllData() async {
    _logger.w('清除所有現有數據');
    final db = await _db.database;

    await db.delete('exercise_logs');
    await db.delete('exercises');
    await db.delete('tasks');
    await db.delete('events');
    await db.delete('daily_points');
  }

  Future<void> _insertAllData(Map<String, dynamic> data) async {
    final exercises = data['exercises'] as List;
    for (final exercise in exercises) {
      await _db.createExercise(Exercise.fromJson(exercise as Map<String, dynamic>));
    }

    final logs = data['exercise_logs'] as List;
    for (final log in logs) {
      await _db.createOrUpdateLog(ExerciseLog.fromJson(log as Map<String, dynamic>));
    }

    final tasks = data['tasks'] as List;
    for (final task in tasks) {
      await _db.createTask(task as Map<String, dynamic>);
    }

    final events = data['events'] as List;
    for (final event in events) {
      await _db.createEvent(event as Map<String, dynamic>);
    }

    final points = data['daily_points'] as List;
    for (final point in points) {
      await _db.saveDailyPoints(point as Map<String, dynamic>);
    }

    _logger.i('所有數據已導入');
  }

  Future<void> _insertWithSkip(Map<String, dynamic> data) async {
    _logger.i('使用跳過策略導入數據');

    try {
      await _insertAllData(data);
    } catch (e) {
      _logger.w('部分數據跳過: $e');
    }
  }

  Future<void> _mergeData(Map<String, dynamic> data) async {
    _logger.i('使用合併策略導入數據');
    await _insertWithSkip(data);
  }
}

enum ImportStrategy {
  overwrite,
  skip,
  merge,
}

class BackupException implements Exception {
  final String message;
  BackupException(this.message);

  @override
  String toString() => 'BackupException: $message';
}
