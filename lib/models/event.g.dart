// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalendarEventImpl _$$CalendarEventImplFromJson(Map<String, dynamic> json) =>
    _$CalendarEventImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String,
      eventDate: json['eventDate'] as String,
      description: json['description'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$CalendarEventImplToJson(_$CalendarEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'eventDate': instance.eventDate,
      'description': instance.description,
      'createdAt': instance.createdAt,
    };
