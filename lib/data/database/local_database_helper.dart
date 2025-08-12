import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:uptodo/core/constants/database_constants.dart';

class DatabaseHelper {
  DatabaseHelper._internal();
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DatabaseConstants.dbName);
    return await openDatabase(path,
        version: DatabaseConstants.dbVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE ${DatabaseConstants.categoriesTable} (
      ${DatabaseConstants.categoryId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${DatabaseConstants.categoryName} TEXT NOT NULL,
      ${DatabaseConstants.categoryIcon} TEXT,
      ${DatabaseConstants.categoryIconColor} TEXT,
      ${DatabaseConstants.categoryBackgroundColor} TEXT
      )''');

    await db.execute('''
    CREATE TABLE ${DatabaseConstants.tasksTable} (
      ${DatabaseConstants.taskId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${DatabaseConstants.taskTitle} TEXT NOT NULL,
      ${DatabaseConstants.taskDescription} TEXT,
      ${DatabaseConstants.taskIsCompleted} INTEGER NOT NULL,
      ${DatabaseConstants.taskDueDateTime} TEXT NOT NULL,
      ${DatabaseConstants.taskCategoryId} INTEGER NOT NULL,
      ${DatabaseConstants.taskPriority} INTEGER NOT NULL,
      FOREIGN KEY (${DatabaseConstants.taskCategoryId}) REFERENCES ${DatabaseConstants.categoriesTable}(${DatabaseConstants.categoryId})
    )''');
  }
}
