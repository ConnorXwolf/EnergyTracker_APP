// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Exercise _$ExerciseFromJson(Map<String, dynamic> json) {
  return _Exercise.fromJson(json);
}

/// @nodoc
mixin _$Exercise {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_value')
  int get targetValue => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Exercise to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseCopyWith<Exercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseCopyWith<$Res> {
  factory $ExerciseCopyWith(Exercise value, $Res Function(Exercise) then) =
      _$ExerciseCopyWithImpl<$Res, Exercise>;
  @useResult
  $Res call(
      {int id,
      String name,
      String category,
      String color,
      @JsonKey(name: 'target_value') int targetValue,
      String unit,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class _$ExerciseCopyWithImpl<$Res, $Val extends Exercise>
    implements $ExerciseCopyWith<$Res> {
  _$ExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? color = null,
    Object? targetValue = null,
    Object? unit = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseImplCopyWith<$Res>
    implements $ExerciseCopyWith<$Res> {
  factory _$$ExerciseImplCopyWith(
          _$ExerciseImpl value, $Res Function(_$ExerciseImpl) then) =
      __$$ExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String category,
      String color,
      @JsonKey(name: 'target_value') int targetValue,
      String unit,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class __$$ExerciseImplCopyWithImpl<$Res>
    extends _$ExerciseCopyWithImpl<$Res, _$ExerciseImpl>
    implements _$$ExerciseImplCopyWith<$Res> {
  __$$ExerciseImplCopyWithImpl(
      _$ExerciseImpl _value, $Res Function(_$ExerciseImpl) _then)
      : super(_value, _then);

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? color = null,
    Object? targetValue = null,
    Object? unit = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$ExerciseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseImpl implements _Exercise {
  const _$ExerciseImpl(
      {this.id = 0,
      required this.name,
      required this.category,
      required this.color,
      @JsonKey(name: 'target_value') required this.targetValue,
      required this.unit,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$ExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final String name;
  @override
  final String category;
  @override
  final String color;
  @override
  @JsonKey(name: 'target_value')
  final int targetValue;
  @override
  final String unit;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'Exercise(id: $id, name: $name, category: $category, color: $color, targetValue: $targetValue, unit: $unit, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.targetValue, targetValue) ||
                other.targetValue == targetValue) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, category, color, targetValue, unit, createdAt);

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      __$$ExerciseImplCopyWithImpl<_$ExerciseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseImplToJson(
      this,
    );
  }
}

abstract class _Exercise implements Exercise {
  const factory _Exercise(
      {final int id,
      required final String name,
      required final String category,
      required final String color,
      @JsonKey(name: 'target_value') required final int targetValue,
      required final String unit,
      @JsonKey(name: 'created_at') final String? createdAt}) = _$ExerciseImpl;

  factory _Exercise.fromJson(Map<String, dynamic> json) =
      _$ExerciseImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get category;
  @override
  String get color;
  @override
  @JsonKey(name: 'target_value')
  int get targetValue;
  @override
  String get unit;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExerciseLog _$ExerciseLogFromJson(Map<String, dynamic> json) {
  return _ExerciseLog.fromJson(json);
}

/// @nodoc
mixin _$ExerciseLog {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'exercise_id')
  int get exerciseId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  @BoolToIntConverter()
  bool get completed => throw _privateConstructorUsedError;
  @JsonKey(name: 'actual_value')
  int get actualValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_value')
  int get targetValue => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get exerciseName => throw _privateConstructorUsedError;
  @JsonKey(name: 'color')
  String? get exerciseColor => throw _privateConstructorUsedError;

  /// Serializes this ExerciseLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExerciseLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseLogCopyWith<ExerciseLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseLogCopyWith<$Res> {
  factory $ExerciseLogCopyWith(
          ExerciseLog value, $Res Function(ExerciseLog) then) =
      _$ExerciseLogCopyWithImpl<$Res, ExerciseLog>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'exercise_id') int exerciseId,
      String date,
      @BoolToIntConverter() bool completed,
      @JsonKey(name: 'actual_value') int actualValue,
      @JsonKey(name: 'target_value') int targetValue,
      String unit,
      String category,
      String notes,
      @JsonKey(name: 'name') String? exerciseName,
      @JsonKey(name: 'color') String? exerciseColor});
}

/// @nodoc
class _$ExerciseLogCopyWithImpl<$Res, $Val extends ExerciseLog>
    implements $ExerciseLogCopyWith<$Res> {
  _$ExerciseLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? exerciseId = null,
    Object? date = null,
    Object? completed = null,
    Object? actualValue = null,
    Object? targetValue = null,
    Object? unit = null,
    Object? category = null,
    Object? notes = null,
    Object? exerciseName = freezed,
    Object? exerciseColor = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      actualValue: null == actualValue
          ? _value.actualValue
          : actualValue // ignore: cast_nullable_to_non_nullable
              as int,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseName: freezed == exerciseName
          ? _value.exerciseName
          : exerciseName // ignore: cast_nullable_to_non_nullable
              as String?,
      exerciseColor: freezed == exerciseColor
          ? _value.exerciseColor
          : exerciseColor // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseLogImplCopyWith<$Res>
    implements $ExerciseLogCopyWith<$Res> {
  factory _$$ExerciseLogImplCopyWith(
          _$ExerciseLogImpl value, $Res Function(_$ExerciseLogImpl) then) =
      __$$ExerciseLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'exercise_id') int exerciseId,
      String date,
      @BoolToIntConverter() bool completed,
      @JsonKey(name: 'actual_value') int actualValue,
      @JsonKey(name: 'target_value') int targetValue,
      String unit,
      String category,
      String notes,
      @JsonKey(name: 'name') String? exerciseName,
      @JsonKey(name: 'color') String? exerciseColor});
}

/// @nodoc
class __$$ExerciseLogImplCopyWithImpl<$Res>
    extends _$ExerciseLogCopyWithImpl<$Res, _$ExerciseLogImpl>
    implements _$$ExerciseLogImplCopyWith<$Res> {
  __$$ExerciseLogImplCopyWithImpl(
      _$ExerciseLogImpl _value, $Res Function(_$ExerciseLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExerciseLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? exerciseId = null,
    Object? date = null,
    Object? completed = null,
    Object? actualValue = null,
    Object? targetValue = null,
    Object? unit = null,
    Object? category = null,
    Object? notes = null,
    Object? exerciseName = freezed,
    Object? exerciseColor = freezed,
  }) {
    return _then(_$ExerciseLogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      actualValue: null == actualValue
          ? _value.actualValue
          : actualValue // ignore: cast_nullable_to_non_nullable
              as int,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseName: freezed == exerciseName
          ? _value.exerciseName
          : exerciseName // ignore: cast_nullable_to_non_nullable
              as String?,
      exerciseColor: freezed == exerciseColor
          ? _value.exerciseColor
          : exerciseColor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseLogImpl extends _ExerciseLog {
  const _$ExerciseLogImpl(
      {this.id = 0,
      @JsonKey(name: 'exercise_id') required this.exerciseId,
      required this.date,
      @BoolToIntConverter() this.completed = false,
      @JsonKey(name: 'actual_value') this.actualValue = 0,
      @JsonKey(name: 'target_value') required this.targetValue,
      required this.unit,
      required this.category,
      this.notes = '',
      @JsonKey(name: 'name') this.exerciseName,
      @JsonKey(name: 'color') this.exerciseColor})
      : super._();

  factory _$ExerciseLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseLogImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'exercise_id')
  final int exerciseId;
  @override
  final String date;
  @override
  @JsonKey()
  @BoolToIntConverter()
  final bool completed;
  @override
  @JsonKey(name: 'actual_value')
  final int actualValue;
  @override
  @JsonKey(name: 'target_value')
  final int targetValue;
  @override
  final String unit;
  @override
  final String category;
  @override
  @JsonKey()
  final String notes;
  @override
  @JsonKey(name: 'name')
  final String? exerciseName;
  @override
  @JsonKey(name: 'color')
  final String? exerciseColor;

  @override
  String toString() {
    return 'ExerciseLog(id: $id, exerciseId: $exerciseId, date: $date, completed: $completed, actualValue: $actualValue, targetValue: $targetValue, unit: $unit, category: $category, notes: $notes, exerciseName: $exerciseName, exerciseColor: $exerciseColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.actualValue, actualValue) ||
                other.actualValue == actualValue) &&
            (identical(other.targetValue, targetValue) ||
                other.targetValue == targetValue) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.exerciseName, exerciseName) ||
                other.exerciseName == exerciseName) &&
            (identical(other.exerciseColor, exerciseColor) ||
                other.exerciseColor == exerciseColor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      exerciseId,
      date,
      completed,
      actualValue,
      targetValue,
      unit,
      category,
      notes,
      exerciseName,
      exerciseColor);

  /// Create a copy of ExerciseLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseLogImplCopyWith<_$ExerciseLogImpl> get copyWith =>
      __$$ExerciseLogImplCopyWithImpl<_$ExerciseLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseLogImplToJson(
      this,
    );
  }
}

abstract class _ExerciseLog extends ExerciseLog {
  const factory _ExerciseLog(
      {final int id,
      @JsonKey(name: 'exercise_id') required final int exerciseId,
      required final String date,
      @BoolToIntConverter() final bool completed,
      @JsonKey(name: 'actual_value') final int actualValue,
      @JsonKey(name: 'target_value') required final int targetValue,
      required final String unit,
      required final String category,
      final String notes,
      @JsonKey(name: 'name') final String? exerciseName,
      @JsonKey(name: 'color') final String? exerciseColor}) = _$ExerciseLogImpl;
  const _ExerciseLog._() : super._();

  factory _ExerciseLog.fromJson(Map<String, dynamic> json) =
      _$ExerciseLogImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'exercise_id')
  int get exerciseId;
  @override
  String get date;
  @override
  @BoolToIntConverter()
  bool get completed;
  @override
  @JsonKey(name: 'actual_value')
  int get actualValue;
  @override
  @JsonKey(name: 'target_value')
  int get targetValue;
  @override
  String get unit;
  @override
  String get category;
  @override
  String get notes;
  @override
  @JsonKey(name: 'name')
  String? get exerciseName;
  @override
  @JsonKey(name: 'color')
  String? get exerciseColor;

  /// Create a copy of ExerciseLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseLogImplCopyWith<_$ExerciseLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExerciseSummary _$ExerciseSummaryFromJson(Map<String, dynamic> json) {
  return _ExerciseSummary.fromJson(json);
}

/// @nodoc
mixin _$ExerciseSummary {
  int get totalExercises => throw _privateConstructorUsedError;
  int get completedCount => throw _privateConstructorUsedError;
  double get completionRate => throw _privateConstructorUsedError;
  int get totalActual => throw _privateConstructorUsedError;
  int get totalTarget => throw _privateConstructorUsedError;
  double get progressRate => throw _privateConstructorUsedError;

  /// Serializes this ExerciseSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExerciseSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseSummaryCopyWith<ExerciseSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseSummaryCopyWith<$Res> {
  factory $ExerciseSummaryCopyWith(
          ExerciseSummary value, $Res Function(ExerciseSummary) then) =
      _$ExerciseSummaryCopyWithImpl<$Res, ExerciseSummary>;
  @useResult
  $Res call(
      {int totalExercises,
      int completedCount,
      double completionRate,
      int totalActual,
      int totalTarget,
      double progressRate});
}

/// @nodoc
class _$ExerciseSummaryCopyWithImpl<$Res, $Val extends ExerciseSummary>
    implements $ExerciseSummaryCopyWith<$Res> {
  _$ExerciseSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalExercises = null,
    Object? completedCount = null,
    Object? completionRate = null,
    Object? totalActual = null,
    Object? totalTarget = null,
    Object? progressRate = null,
  }) {
    return _then(_value.copyWith(
      totalExercises: null == totalExercises
          ? _value.totalExercises
          : totalExercises // ignore: cast_nullable_to_non_nullable
              as int,
      completedCount: null == completedCount
          ? _value.completedCount
          : completedCount // ignore: cast_nullable_to_non_nullable
              as int,
      completionRate: null == completionRate
          ? _value.completionRate
          : completionRate // ignore: cast_nullable_to_non_nullable
              as double,
      totalActual: null == totalActual
          ? _value.totalActual
          : totalActual // ignore: cast_nullable_to_non_nullable
              as int,
      totalTarget: null == totalTarget
          ? _value.totalTarget
          : totalTarget // ignore: cast_nullable_to_non_nullable
              as int,
      progressRate: null == progressRate
          ? _value.progressRate
          : progressRate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseSummaryImplCopyWith<$Res>
    implements $ExerciseSummaryCopyWith<$Res> {
  factory _$$ExerciseSummaryImplCopyWith(_$ExerciseSummaryImpl value,
          $Res Function(_$ExerciseSummaryImpl) then) =
      __$$ExerciseSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalExercises,
      int completedCount,
      double completionRate,
      int totalActual,
      int totalTarget,
      double progressRate});
}

/// @nodoc
class __$$ExerciseSummaryImplCopyWithImpl<$Res>
    extends _$ExerciseSummaryCopyWithImpl<$Res, _$ExerciseSummaryImpl>
    implements _$$ExerciseSummaryImplCopyWith<$Res> {
  __$$ExerciseSummaryImplCopyWithImpl(
      _$ExerciseSummaryImpl _value, $Res Function(_$ExerciseSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExerciseSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalExercises = null,
    Object? completedCount = null,
    Object? completionRate = null,
    Object? totalActual = null,
    Object? totalTarget = null,
    Object? progressRate = null,
  }) {
    return _then(_$ExerciseSummaryImpl(
      totalExercises: null == totalExercises
          ? _value.totalExercises
          : totalExercises // ignore: cast_nullable_to_non_nullable
              as int,
      completedCount: null == completedCount
          ? _value.completedCount
          : completedCount // ignore: cast_nullable_to_non_nullable
              as int,
      completionRate: null == completionRate
          ? _value.completionRate
          : completionRate // ignore: cast_nullable_to_non_nullable
              as double,
      totalActual: null == totalActual
          ? _value.totalActual
          : totalActual // ignore: cast_nullable_to_non_nullable
              as int,
      totalTarget: null == totalTarget
          ? _value.totalTarget
          : totalTarget // ignore: cast_nullable_to_non_nullable
              as int,
      progressRate: null == progressRate
          ? _value.progressRate
          : progressRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseSummaryImpl implements _ExerciseSummary {
  const _$ExerciseSummaryImpl(
      {this.totalExercises = 0,
      this.completedCount = 0,
      this.completionRate = 0.0,
      this.totalActual = 0,
      this.totalTarget = 1,
      this.progressRate = 0.0});

  factory _$ExerciseSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseSummaryImplFromJson(json);

  @override
  @JsonKey()
  final int totalExercises;
  @override
  @JsonKey()
  final int completedCount;
  @override
  @JsonKey()
  final double completionRate;
  @override
  @JsonKey()
  final int totalActual;
  @override
  @JsonKey()
  final int totalTarget;
  @override
  @JsonKey()
  final double progressRate;

  @override
  String toString() {
    return 'ExerciseSummary(totalExercises: $totalExercises, completedCount: $completedCount, completionRate: $completionRate, totalActual: $totalActual, totalTarget: $totalTarget, progressRate: $progressRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseSummaryImpl &&
            (identical(other.totalExercises, totalExercises) ||
                other.totalExercises == totalExercises) &&
            (identical(other.completedCount, completedCount) ||
                other.completedCount == completedCount) &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate) &&
            (identical(other.totalActual, totalActual) ||
                other.totalActual == totalActual) &&
            (identical(other.totalTarget, totalTarget) ||
                other.totalTarget == totalTarget) &&
            (identical(other.progressRate, progressRate) ||
                other.progressRate == progressRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalExercises, completedCount,
      completionRate, totalActual, totalTarget, progressRate);

  /// Create a copy of ExerciseSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseSummaryImplCopyWith<_$ExerciseSummaryImpl> get copyWith =>
      __$$ExerciseSummaryImplCopyWithImpl<_$ExerciseSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseSummaryImplToJson(
      this,
    );
  }
}

abstract class _ExerciseSummary implements ExerciseSummary {
  const factory _ExerciseSummary(
      {final int totalExercises,
      final int completedCount,
      final double completionRate,
      final int totalActual,
      final int totalTarget,
      final double progressRate}) = _$ExerciseSummaryImpl;

  factory _ExerciseSummary.fromJson(Map<String, dynamic> json) =
      _$ExerciseSummaryImpl.fromJson;

  @override
  int get totalExercises;
  @override
  int get completedCount;
  @override
  double get completionRate;
  @override
  int get totalActual;
  @override
  int get totalTarget;
  @override
  double get progressRate;

  /// Create a copy of ExerciseSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseSummaryImplCopyWith<_$ExerciseSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
