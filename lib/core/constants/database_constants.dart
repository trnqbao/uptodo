class DatabaseConstants {
  // db
  static const String dbName = "uptodo.db";
  static const int dbVersion = 1;

  // tables
  static const String tasksTable = "tasks";
  static const String categoriesTable = "categories";

  // task columns
  static const String taskId = 'id';
  static const String taskTitle = 'title';
  static const String taskDescription = 'description';
  static const String taskDueDateTime = 'dueDateTime';
  static const String taskIsCompleted = 'isCompleted';
  static const String taskCategoryId = 'categoryId';
  static const String taskPriority = 'priority';

  // category columns
  static const String categoryId = 'id';
  static const String categoryName = 'name';
  static const String categoryIcon = 'icon';
  static const String categoryIconColor = 'iconColor';
  static const String categoryBackgroundColor = 'backgroundColor';
}
