import 'package:uptodo/data/database/local_database_helper.dart';
import '../../core/constants/database_constants.dart';

import '../models/task_model.dart';

class TaskRepository {
  final dbInstance = DatabaseHelper.instance;

  Future<int> addTask(Task task) async {
    final db = await dbInstance.database;
    return await db.insert(
        DatabaseConstants.tasksTable,
        task.toMap());
  }

  // retrieve all tasks from the database (default by current date)
  Future<List<Task>> getTasks() async {
    final db = await dbInstance.database;
    final List<Map<String, dynamic>> maps = await db.query(
        DatabaseConstants.tasksTable);
    return List.generate(maps.length, (i) {
      return Task.fromMap(maps[i]);
    });
  }
}