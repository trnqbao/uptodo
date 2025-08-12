import 'package:uptodo/data/database/local_database_helper.dart';
import 'package:uptodo/data/models/task_category_model.dart';

import '../../core/constants/database_constants.dart';

class CategoryRepository {
  final dbInstance = DatabaseHelper.instance;

  Future<int> addCategory(TaskCategory category) async {
    final db = await dbInstance.database;
    return await db.insert(
        DatabaseConstants.categoriesTable,
        category.toMap());
  }

  Future<List<TaskCategory>> getCategories() async {
    final db = await dbInstance.database;
    final List<Map<String, dynamic>> maps = await db.query(
        DatabaseConstants.categoriesTable);
    return List.generate(maps.length, (i) {
      return TaskCategory.fromMap(maps[i]);
    });
  }
}