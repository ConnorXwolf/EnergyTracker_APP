// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hp_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HPDataImpl _$$HPDataImplFromJson(Map<String, dynamic> json) => _$HPDataImpl(
      date: json['date'] as String,
      physical: (json['physical'] as num?)?.toInt() ?? 0,
      mental: (json['mental'] as num?)?.toInt() ?? 0,
      hp: (json['hp'] as num?)?.toInt() ?? 20,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$HPDataImplToJson(_$HPDataImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'physical': instance.physical,
      'mental': instance.mental,
      'hp': instance.hp,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
