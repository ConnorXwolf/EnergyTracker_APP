// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseImpl _$$ExerciseImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String,
      category: json['category'] as String,
      color: json['color'] as String,
      targetValue: (json['target_value'] as num).toInt(),
      unit: json['unit'] as String,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$ExerciseImplToJson(_$ExerciseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'color': instance.color,
      'target_value': instance.targetValue,
      'unit': instance.unit,
      'created_at': instance.createdAt,
    };

_$ExerciseLogImpl _$$ExerciseLogImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseLogImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      exerciseId: (json['exercise_id'] as num).toInt(),
      date: json['date'] as String,
      completed: json['completed'] == null
          ? false
          : const BoolToIntConverter()
              .fromJson((json['completed'] as num).toInt()),
      actualValue: (json['actual_value'] as num?)?.toInt() ?? 0,
      targetValue: (json['target_value'] as num).toInt(),
      unit: json['unit'] as String,
      category: json['category'] as String,
      notes: json['notes'] as String? ?? '',
      exerciseName: json['name'] as String?,
      exerciseColor: json['color'] as String?,
    );

Map<String, dynamic> _$$ExerciseLogImplToJson(_$ExerciseLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exercise_id': instance.exerciseId,
      'date': instance.date,
      'completed': const BoolToIntConverter().toJson(instance.completed),
      'actual_value': instance.actualValue,
      'target_value': instance.targetValue,
      'unit': instance.unit,
      'category': instance.category,
      'notes': instance.notes,
      'name': instance.exerciseName,
      'color': instance.exerciseColor,
    };

_$ExerciseSummaryImpl _$$ExerciseSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$ExerciseSummaryImpl(
      totalExercises: (json['totalExercises'] as num?)?.toInt() ?? 0,
      completedCount: (json['completedCount'] as num?)?.toInt() ?? 0,
      completionRate: (json['completionRate'] as num?)?.toDouble() ?? 0.0,
      totalActual: (json['totalActual'] as num?)?.toInt() ?? 0,
      totalTarget: (json['totalTarget'] as num?)?.toInt() ?? 1,
      progressRate: (json['progressRate'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$ExerciseSummaryImplToJson(
        _$ExerciseSummaryImpl instance) =>
    <String, dynamic>{
      'totalExercises': instance.totalExercises,
      'completedCount': instance.completedCount,
      'completionRate': instance.completionRate,
      'totalActual': instance.totalActual,
      'totalTarget': instance.totalTarget,
      'progressRate': instance.progressRate,
    };
