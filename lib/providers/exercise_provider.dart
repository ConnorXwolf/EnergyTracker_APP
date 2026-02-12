import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../models/exercise.dart';
import '../database/database_helper.dart';
import '../utils/date_helpers.dart';
import '../utils/constants.dart';

final _logger = Logger();

final exercisesProvider = StateNotifierProvider<ExercisesNotifier, List<Exercise>>((ref) {
  return ExercisesNotifier();
});

class ExercisesNotifier extends StateNotifier<List<Exercise>> {
  ExercisesNotifier() : super([]) {
    loadExercises();
  }

  Future<void> loadExercises() async {
    try {
      final db = DatabaseHelper.instance;
      state = await db.getAllExercises();
      _logger.d('Loaded ${state.length} exercises');
    } catch (e) {
      _logger.e('Error loading exercises: $e');
    }
  }

  Future<int?> createExercise({
    required String name,
    required String category,
    required int targetValue,
    required String unit,
  }) async {
    try {
      final color = _getCategoryColor(category);
      final exercise = Exercise(
        name: name,
        category: category,
        color: color,
        targetValue: targetValue,
        unit: unit,
      );

      final db = DatabaseHelper.instance;
      final id = await db.createExercise(exercise);

      await loadExercises();
      _logger.i('Created exercise: $name (id: $id)');
      return id;
    } catch (e) {
      _logger.e('Error creating exercise: $e');
      return null;
    }
  }

  Future<bool> updateExercise(Exercise exercise) async {
    try {
      final db = DatabaseHelper.instance;
      final count = await db.updateExercise(exercise);

      if (count > 0) {
        await loadExercises();
        _logger.i('Updated exercise: ${exercise.name}');
        return true;
      }
      return false;
    } catch (e) {
      _logger.e('Error updating exercise: $e');
      return false;
    }
  }

  Future<bool> deleteExercise(int id) async {
    try {
      final db = DatabaseHelper.instance;
      final count = await db.deleteExercise(id);

      if (count > 0) {
        await loadExercises();
        _logger.i('Deleted exercise (id: $id)');
        return true;
      }
      return false;
    } catch (e) {
      _logger.e('Error deleting exercise: $e');
      return false;
    }
  }

  String _getCategoryColor(String category) {
    final Color color;
    switch (category) {
      case 'cardio':
        color = AppColors.cardio;
        break;
      case 'muscle':
        color = AppColors.muscle;
        break;
      case 'stretch':
        color = AppColors.stretch;
        break;
      default:
        color = const Color(0xFF808080);
    }
    
    // 移除 alpha 通道，只保留 RGB
    final rgb = color.value & 0x00FFFFFF;
    return '#${rgb.toRadixString(16).padLeft(6, '0')}';
  }
}

final exerciseLogsProvider = FutureProvider.family<List<ExerciseLog>, String>((ref, date) async {
  final db = DatabaseHelper.instance;
  final exercises = ref.watch(exercisesProvider);
  
  final logs = await db.getLogsByDate(date);
  
  final logMap = {for (var log in logs) log.exerciseId: log};
  
  final result = <ExerciseLog>[];
  for (final exercise in exercises) {
    if (logMap.containsKey(exercise.id)) {
      result.add(logMap[exercise.id]!);
    } else {
      result.add(ExerciseLog(
        exerciseId: exercise.id,
        date: date,
        targetValue: exercise.targetValue,
        unit: exercise.unit,
        category: exercise.category,
        exerciseName: exercise.name,
        exerciseColor: exercise.color,
      ));
    }
  }
  
  return result;
});

final updateExerciseProgressProvider = Provider((ref) {
  return ({
    required int exerciseId,
    required String date,
    required int actualValue,
    required bool completed,
    String notes = '',
  }) async {
    try {
      final db = DatabaseHelper.instance;
      final log = ExerciseLog(
        exerciseId: exerciseId,
        date: date,
        actualValue: actualValue,
        completed: completed,
        notes: notes,
        // These values are not stored in the log table but are required by the model
        targetValue: 0, 
        unit: '',
        category: '',
      );

      await db.createOrUpdateLog(log);
      ref.invalidate(exerciseLogsProvider(date));
      
      _logger.d('Updated exercise progress for $date');
      return true;
    } catch (e) {
      _logger.e('Error updating progress: $e');
      return false;
    }
  };
});

final todayExerciseLogsProvider = FutureProvider<List<ExerciseLog>>((ref) async {
  final today = DateHelpers.getToday();
  return ref.watch(exerciseLogsProvider(today).future);
});