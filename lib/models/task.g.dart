// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
      date: json['date'] as String,
      dueDate: json['dueDate'] as String?,
      priority: (json['priority'] as num?)?.toInt() ?? 0,
      category: json['category'] as String?,
      createdAt: json['createdAt'] as String?,
      completedAt: json['completedAt'] as String?,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isCompleted': instance.isCompleted,
      'date': instance.date,
      'dueDate': instance.dueDate,
      'priority': instance.priority,
      'category': instance.category,
      'createdAt': instance.createdAt,
      'completedAt': instance.completedAt,
    };

_$TaskGroupImpl _$$TaskGroupImplFromJson(Map<String, dynamic> json) =>
    _$TaskGroupImpl(
      category: json['category'] as String,
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      requiredCount: (json['requiredCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TaskGroupImplToJson(_$TaskGroupImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'tasks': instance.tasks,
      'requiredCount': instance.requiredCount,
    };
