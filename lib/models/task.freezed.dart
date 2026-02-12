// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String? get dueDate => throw _privateConstructorUsedError;
  int get priority => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get completedAt => throw _privateConstructorUsedError;

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {int id,
      String title,
      bool isCompleted,
      String date,
      String? dueDate,
      int priority,
      String? category,
      String? createdAt,
      String? completedAt});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isCompleted = null,
    Object? date = null,
    Object? dueDate = freezed,
    Object? priority = null,
    Object? category = freezed,
    Object? createdAt = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      bool isCompleted,
      String date,
      String? dueDate,
      int priority,
      String? category,
      String? createdAt,
      String? completedAt});
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isCompleted = null,
    Object? date = null,
    Object? dueDate = freezed,
    Object? priority = null,
    Object? category = freezed,
    Object? createdAt = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_$TaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl extends _Task {
  const _$TaskImpl(
      {this.id = 0,
      required this.title,
      this.isCompleted = false,
      required this.date,
      this.dueDate,
      this.priority = 0,
      this.category,
      this.createdAt,
      this.completedAt})
      : super._();

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final String title;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  final String date;
  @override
  final String? dueDate;
  @override
  @JsonKey()
  final int priority;
  @override
  final String? category;
  @override
  final String? createdAt;
  @override
  final String? completedAt;

  @override
  String toString() {
    return 'Task(id: $id, title: $title, isCompleted: $isCompleted, date: $date, dueDate: $dueDate, priority: $priority, category: $category, createdAt: $createdAt, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, isCompleted, date,
      dueDate, priority, category, createdAt, completedAt);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task extends Task {
  const factory _Task(
      {final int id,
      required final String title,
      final bool isCompleted,
      required final String date,
      final String? dueDate,
      final int priority,
      final String? category,
      final String? createdAt,
      final String? completedAt}) = _$TaskImpl;
  const _Task._() : super._();

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  bool get isCompleted;
  @override
  String get date;
  @override
  String? get dueDate;
  @override
  int get priority;
  @override
  String? get category;
  @override
  String? get createdAt;
  @override
  String? get completedAt;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskGroup _$TaskGroupFromJson(Map<String, dynamic> json) {
  return _TaskGroup.fromJson(json);
}

/// @nodoc
mixin _$TaskGroup {
  String get category => throw _privateConstructorUsedError;
  List<Task> get tasks => throw _privateConstructorUsedError;
  int? get requiredCount => throw _privateConstructorUsedError;

  /// Serializes this TaskGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskGroupCopyWith<TaskGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskGroupCopyWith<$Res> {
  factory $TaskGroupCopyWith(TaskGroup value, $Res Function(TaskGroup) then) =
      _$TaskGroupCopyWithImpl<$Res, TaskGroup>;
  @useResult
  $Res call({String category, List<Task> tasks, int? requiredCount});
}

/// @nodoc
class _$TaskGroupCopyWithImpl<$Res, $Val extends TaskGroup>
    implements $TaskGroupCopyWith<$Res> {
  _$TaskGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? tasks = null,
    Object? requiredCount = freezed,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      requiredCount: freezed == requiredCount
          ? _value.requiredCount
          : requiredCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskGroupImplCopyWith<$Res>
    implements $TaskGroupCopyWith<$Res> {
  factory _$$TaskGroupImplCopyWith(
          _$TaskGroupImpl value, $Res Function(_$TaskGroupImpl) then) =
      __$$TaskGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String category, List<Task> tasks, int? requiredCount});
}

/// @nodoc
class __$$TaskGroupImplCopyWithImpl<$Res>
    extends _$TaskGroupCopyWithImpl<$Res, _$TaskGroupImpl>
    implements _$$TaskGroupImplCopyWith<$Res> {
  __$$TaskGroupImplCopyWithImpl(
      _$TaskGroupImpl _value, $Res Function(_$TaskGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? tasks = null,
    Object? requiredCount = freezed,
  }) {
    return _then(_$TaskGroupImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      requiredCount: freezed == requiredCount
          ? _value.requiredCount
          : requiredCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskGroupImpl extends _TaskGroup {
  const _$TaskGroupImpl(
      {required this.category,
      final List<Task> tasks = const [],
      this.requiredCount})
      : _tasks = tasks,
        super._();

  factory _$TaskGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskGroupImplFromJson(json);

  @override
  final String category;
  final List<Task> _tasks;
  @override
  @JsonKey()
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  final int? requiredCount;

  @override
  String toString() {
    return 'TaskGroup(category: $category, tasks: $tasks, requiredCount: $requiredCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskGroupImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.requiredCount, requiredCount) ||
                other.requiredCount == requiredCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, category,
      const DeepCollectionEquality().hash(_tasks), requiredCount);

  /// Create a copy of TaskGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskGroupImplCopyWith<_$TaskGroupImpl> get copyWith =>
      __$$TaskGroupImplCopyWithImpl<_$TaskGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskGroupImplToJson(
      this,
    );
  }
}

abstract class _TaskGroup extends TaskGroup {
  const factory _TaskGroup(
      {required final String category,
      final List<Task> tasks,
      final int? requiredCount}) = _$TaskGroupImpl;
  const _TaskGroup._() : super._();

  factory _TaskGroup.fromJson(Map<String, dynamic> json) =
      _$TaskGroupImpl.fromJson;

  @override
  String get category;
  @override
  List<Task> get tasks;
  @override
  int? get requiredCount;

  /// Create a copy of TaskGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskGroupImplCopyWith<_$TaskGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
