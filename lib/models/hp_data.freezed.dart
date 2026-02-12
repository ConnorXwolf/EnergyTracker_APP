// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hp_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HPData _$HPDataFromJson(Map<String, dynamic> json) {
  return _HPData.fromJson(json);
}

/// @nodoc
mixin _$HPData {
  String get date => throw _privateConstructorUsedError;
  int get physical => throw _privateConstructorUsedError;
  int get mental => throw _privateConstructorUsedError;
  int get hp => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this HPData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HPData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HPDataCopyWith<HPData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HPDataCopyWith<$Res> {
  factory $HPDataCopyWith(HPData value, $Res Function(HPData) then) =
      _$HPDataCopyWithImpl<$Res, HPData>;
  @useResult
  $Res call(
      {String date,
      int physical,
      int mental,
      int hp,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$HPDataCopyWithImpl<$Res, $Val extends HPData>
    implements $HPDataCopyWith<$Res> {
  _$HPDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HPData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? physical = null,
    Object? mental = null,
    Object? hp = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      physical: null == physical
          ? _value.physical
          : physical // ignore: cast_nullable_to_non_nullable
              as int,
      mental: null == mental
          ? _value.mental
          : mental // ignore: cast_nullable_to_non_nullable
              as int,
      hp: null == hp
          ? _value.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HPDataImplCopyWith<$Res> implements $HPDataCopyWith<$Res> {
  factory _$$HPDataImplCopyWith(
          _$HPDataImpl value, $Res Function(_$HPDataImpl) then) =
      __$$HPDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      int physical,
      int mental,
      int hp,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$HPDataImplCopyWithImpl<$Res>
    extends _$HPDataCopyWithImpl<$Res, _$HPDataImpl>
    implements _$$HPDataImplCopyWith<$Res> {
  __$$HPDataImplCopyWithImpl(
      _$HPDataImpl _value, $Res Function(_$HPDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HPData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? physical = null,
    Object? mental = null,
    Object? hp = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$HPDataImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      physical: null == physical
          ? _value.physical
          : physical // ignore: cast_nullable_to_non_nullable
              as int,
      mental: null == mental
          ? _value.mental
          : mental // ignore: cast_nullable_to_non_nullable
              as int,
      hp: null == hp
          ? _value.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HPDataImpl extends _HPData {
  const _$HPDataImpl(
      {required this.date,
      this.physical = 0,
      this.mental = 0,
      this.hp = 20,
      this.createdAt,
      this.updatedAt})
      : super._();

  factory _$HPDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$HPDataImplFromJson(json);

  @override
  final String date;
  @override
  @JsonKey()
  final int physical;
  @override
  @JsonKey()
  final int mental;
  @override
  @JsonKey()
  final int hp;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'HPData(date: $date, physical: $physical, mental: $mental, hp: $hp, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HPDataImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.physical, physical) ||
                other.physical == physical) &&
            (identical(other.mental, mental) || other.mental == mental) &&
            (identical(other.hp, hp) || other.hp == hp) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, physical, mental, hp, createdAt, updatedAt);

  /// Create a copy of HPData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HPDataImplCopyWith<_$HPDataImpl> get copyWith =>
      __$$HPDataImplCopyWithImpl<_$HPDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HPDataImplToJson(
      this,
    );
  }
}

abstract class _HPData extends HPData {
  const factory _HPData(
      {required final String date,
      final int physical,
      final int mental,
      final int hp,
      final String? createdAt,
      final String? updatedAt}) = _$HPDataImpl;
  const _HPData._() : super._();

  factory _HPData.fromJson(Map<String, dynamic> json) = _$HPDataImpl.fromJson;

  @override
  String get date;
  @override
  int get physical;
  @override
  int get mental;
  @override
  int get hp;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of HPData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HPDataImplCopyWith<_$HPDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
