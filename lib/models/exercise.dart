import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise.freezed.dart';
part 'exercise.g.dart';

@freezed
class Exercise with _$Exercise {
  const factory Exercise({
    @Default(0) int id,
    required String name,``
    required String category,
    required String color,
    @JsonKey(name: 'target_value') required int targetValue,
    required String unit,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _Exercise;

  factory Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);
}

class BoolToIntConverter implements JsonConverter<bool, int> {
  const BoolToIntConverter();

  @override
  bool fromJson(int json) => json == 1;

  @override
  int toJson(bool object) => object ? 1 : 0;
}

@freezed
class ExerciseLog with _$ExerciseLog {
  const factory ExerciseLog({
    @Default(0) int id,
    @JsonKey(name: 'exercise_id') required int exerciseId,
    required String date,
    @Default(false) @BoolToIntConverter() bool completed,
    @JsonKey(name: 'actual_value') @Default(0) int actualValue,
    @JsonKey(name: 'target_value') required int targetValue,
    required String unit,
    required String category,
    @Default('') String notes,
    @JsonKey(name: 'name') String? exerciseName,
    @JsonKey(name: 'color') String? exerciseColor,
  }) = _ExerciseLog;

  const ExerciseLog._();

  factory ExerciseLog.fromJson(Map<String, dynamic> json) => _$ExerciseLogFromJson(json);

  double get progressPercentage {
    if (targetValue == 0) return 0.0;
    return (actualValue / targetValue * 100).clamp(0.0, 100.0);
  }

  bool get isOverAchieved => actualValue > targetValue;
}

@freezed
class ExerciseSummary with _$ExerciseSummary {
  const factory ExerciseSummary({
    @Default(0) int totalExercises,
    @Default(0) int completedCount,
    @Default(0.0) double completionRate,
    @Default(0) int totalActual,
    @Default(1) int totalTarget,
    @Default(0.0) double progressRate,
  }) = _ExerciseSummary;

  factory ExerciseSummary.fromJson(Map<String, dynamic> json) => _$ExerciseSummaryFromJson(json);
}
