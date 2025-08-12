enum TaskPriority {
  none,
  low,
  medium,
  high,
  urgent
}

extension TaskPriorityExtension on TaskPriority {
  int toInt() {
    return index;
  }

  static TaskPriority fromInt(int value) {
    if (value >= 0 && value < TaskPriority.values.length) {
      return TaskPriority.values[value];
    }
    return TaskPriority.none;
  }
}