import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:logger/logger.dart';

import '../models/exercise.dart';
import 'schema.dart';
import '../utils/constants.dart';

/// SQLite 數據庫管理類（單例模式）
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _database;
  final _logger = Logger();

  DatabaseHelper._internal();

  /// 獲取數據庫實例
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// 初始化數據庫
  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, AppConstants.databaseName);

    _logger.i('Initializing database at: $path');

    return await openDatabase(
      path,
      version: AppConstants.databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  /// 創建數據庫表
  Future<void> _onCreate(Database db, int version) async {
    _logger.i('Creating database tables...');

    for (final statement in DatabaseSchema.createTableStatements) {
      await db.execute(statement);
    }

    for (final statement in DatabaseSchema.createIndexStatements) {
      await db.execute(statement);
    }

    _logger.i('Database tables created successfully');
  }

  /// 數據庫升級
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    _logger.i('Upgrading database from v$oldVersion to v$newVersion');
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE exercises ADD COLUMN created_at TEXT');
    }
  }

  // ==================== Exercise Operations ====================

  /// 創建運動
  Future<int> createExercise(Exercise exercise) async {
    final db = await database;
    final exerciseMap = exercise.toJson();
    // Remove id because it is auto-incremented
    exerciseMap.remove('id');
    // Handle created_at
    exerciseMap['created_at'] = DateTime.now().toIso8601String();
    return await db.insert('exercises', exerciseMap);
  }

  /// 獲取所有運動
  Future<List<Exercise>> getAllExercises() async {
    final db = await database;
    final maps = await db.query(
      'exercises',
      orderBy: 'created_at ASC',
    );
    return maps.map((map) => Exercise.fromJson(map)).toList();
  }

  /// 根據 ID 獲取運動
  Future<Exercise?> getExerciseById(int id) async {
    final db = await database;
    final results = await db.query(
      'exercises',
      where: 'id = ?',
      whereArgs: [id],
    );
    return results.isNotEmpty ? Exercise.fromJson(results.first) : null;
  }

  /// 更新運動
  Future<int> updateExercise(Exercise exercise) async {
    final db = await database;
    return await db.update(
      'exercises',
      exercise.toJson(),
      where: 'id = ?',
      whereArgs: [exercise.id],
    );
  }

  /// 刪除運動
  Future<int> deleteExercise(int id) async {
    final db = await database;
    return await db.delete(
      'exercises',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // ==================== Exercise Log Operations ====================

  /// 創建或更新運動日誌
  Future<int> createOrUpdateLog(ExerciseLog log) async {
    final db = await database;
    final logMap = log.toJson();
    logMap.remove('id');
    return await db.insert(
      'exercise_logs',
      logMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// 根據日期獲取運動日誌
  Future<List<ExerciseLog>> getLogsByDate(String date) async {
    final db = await database;
    final maps = await db.rawQuery('''
      SELECT
        el.id,
        el.exercise_id,
        el.date,
        el.completed,
        el.actual_value,
        el.notes,
        e.target_value,
        e.unit,
        e.category,
        e.name,
        e.color
      FROM exercise_logs el
      JOIN exercises e ON el.exercise_id = e.id
      WHERE el.date = ?
      ORDER BY e.created_at ASC
    ''', [date]);
    return maps.map((map) => ExerciseLog.fromJson(map)).toList();
  }

  // ==================== Task Operations ====================

  /// 創建任務
  Future<int> createTask(Map<String, dynamic> task) async {
    final db = await database;
    return await db.insert('tasks', task);
  }

  /// 獲取所有任務
  Future<List<Map<String, dynamic>>> getAllTasks() async {
    final db = await database;
    return await db.query(
      'tasks',
      orderBy: 'priority DESC, created_at ASC',
    );
  }

  /// 根據日期獲取任務
  Future<List<Map<String, dynamic>>> getTasksByDate(String date) async {
    final db = await database;
    return await db.query(
      'tasks',
      where: 'date = ?',
      whereArgs: [date],
      orderBy: 'priority DESC, created_at ASC',
    );
  }

  /// 根據月份獲取任務
  Future<List<Map<String, dynamic>>> getTasksByMonth(int year, int month) async {
    final db = await database;
    final datePattern = '${year.toString().padLeft(4, '0')}-${month.toString().padLeft(2, '0')}-%';
    return await db.query(
      'tasks',
      where: 'due_date LIKE ?',
      whereArgs: [datePattern],
      orderBy: 'due_date ASC, priority DESC',
    );
  }

  /// 更新任務
  Future<int> updateTask(int id, Map<String, dynamic> task) async {
    final db = await database;
    return await db.update(
      'tasks',
      task,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// 刪除任務
  Future<int> deleteTask(int id) async {
    final db = await database;
    return await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// 清除已完成的任務
  Future<int> clearCompletedTasks() async {
    final db = await database;
    return await db.delete(
      'tasks',
      where: 'is_completed = ?',
      whereArgs: [1],
    );
  }

  // ==================== Event Operations ====================

  /// 創建事件
  Future<int> createEvent(Map<String, dynamic> event) async {
    final db = await database;
    return await db.insert('events', event);
  }

  /// 根據日期獲取事件
  Future<List<Map<String, dynamic>>> getEventsByDate(String date) async {
    final db = await database;
    return await db.query(
      'events',
      where: 'event_date = ?',
      whereArgs: [date],
      orderBy: 'created_at ASC',
    );
  }

  /// 根據月份獲取事件
  Future<List<Map<String, dynamic>>> getEventsByMonth(int year, int month) async {
    final db = await database;
    final datePattern = '${year.toString().padLeft(4, '0')}-${month.toString().padLeft(2, '0')}-%';
    return await db.query(
      'events',
      where: 'event_date LIKE ?',
      whereArgs: [datePattern],
      orderBy: 'event_date ASC',
    );
  }

  /// 刪除事件
  Future<int> deleteEvent(int id) async {
    final db = await database;
    return await db.delete(
      'events',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // ==================== Daily Points Operations ====================

  /// 保存每日點數
  Future<int> saveDailyPoints(Map<String, dynamic> points) async {
    final db = await database;
    return await db.insert(
      'daily_points',
      points,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// 根據日期獲取點數
  Future<Map<String, dynamic>?> getDailyPoints(String date) async {
    final db = await database;
    final results = await db.query(
      'daily_points',
      where: 'date = ?',
      whereArgs: [date],
    );
    return results.isNotEmpty ? results.first : null;
  }

  /// 根據月份獲取點數
  Future<List<Map<String, dynamic>>> getDailyPointsByMonth(int year, int month) async {
    final db = await database;
    final datePattern = '${year.toString().padLeft(4, '0')}-${month.toString().padLeft(2, '0')}-%';
    return await db.query(
      'daily_points',
      where: 'date LIKE ?',
      whereArgs: [datePattern],
      orderBy: 'date ASC',
    );
  }

  /// 關閉數據庫
  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }
}
