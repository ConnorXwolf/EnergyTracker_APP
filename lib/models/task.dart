import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    @Default(0) int id,
    required String title,
    @Default(false) bool isCompleted,
    required String date,
    String? dueDate,
    @Default(0) int priority,
    String? category,
    String? createdAt,
    String? completedAt,
  }) = _Task;

  const Task._();

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as int? ?? 0,
      title: map['title'] as String,
      isCompleted: (map['is_completed'] as int? ?? 0) == 1,
      date: map['date'] as String,
      dueDate: map['due_date'] as String?,
      priority: map['priority'] as int? ?? 0,
      category: map['category'] as String?,
      createdAt: map['created_at'] as String?,
      completedAt: map['completed_at'] as String?,
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      if (id != 0) 'id': id,
      'title': title,
      'is_completed': isCompleted ? 1 : 0,
      'date': date,
      if (dueDate != null) 'due_date': dueDate,
      'priority': priority,
      if (category != null) 'category': category,
      if (createdAt != null) 'created_at': createdAt,
      if (completedAt != null) 'completed_at': completedAt,
    };
  }
  
  bool isOverdue(String currentDate) {
    if (dueDate == null || isCompleted) return false;
    return DateTime.parse(currentDate).isAfter(DateTime.parse(dueDate!));
  }
  
  String getPriorityLabel() {
    switch (priority) {
      case 2: return 'High';
      case 1: return 'Medium';
      default: return 'Low';
    }
  }
}

@freezed
class TaskGroup with _$TaskGroup {
  const factory TaskGroup({
    required String category,
    @Default([]) List<Task> tasks,
    int? requiredCount,
  }) = _TaskGroup;

  const TaskGroup._();

  factory TaskGroup.fromJson(Map<String, dynamic> json) => _$TaskGroupFromJson(json);
  
  int get completedCount => tasks.where((t) => t.isCompleted).length;
  int get totalCount => tasks.length;
  
  bool get isGroupCompleted {
    if (requiredCount != null) {
      return completedCount >= requiredCount!;
    }
    return completedCount == totalCount;
  }
}