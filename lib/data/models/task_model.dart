import 'package:uptodo/core/enums/task_priority.dart';

class Task {
  int? id;
  String title;
  String? description;
  DateTime dueDateTime;
  int categoryId;
  TaskPriority priority;
  bool isCompleted;

  Task({
    this.id,
    required this.title,
    this.description,
    required this.dueDateTime,
    required this.isCompleted,
    required this.categoryId,
    required this.priority,
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'] as String,
      description: map['description'] as String?,
      dueDateTime: DateTime.parse(map['dueDateTime']),
      isCompleted: (map['isCompleted'] as int) == 1,
      categoryId: map['categoryId'],
      priority: TaskPriorityExtension.fromInt(map['priority']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDateTime': dueDateTime.toIso8601String(),
      'isCompleted': isCompleted ? 1 : 0,
      'categoryId': categoryId,
      'priority': priority.toInt(),
    };
  }
}
