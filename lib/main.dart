import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uptodo/data/database/local_database_helper.dart';
import 'package:uptodo/routes/app_pages.dart';
import 'package:get/get.dart';

import 'core/constants/database_constants.dart';
import 'core/themes/app_theme.dart';

Future<bool> checkDatabase(String path) async {
  var dbPath = await getDatabasesPath();
  var dbFile = join(dbPath, path);
  var dbExists = await databaseExists(dbFile);
  return dbExists;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // bool dbExists = await checkDatabase(DatabaseConstants.dbName);
  // if (dbExists) {
  //   print("Database already exists");
  // } else {
  //   print("Database does not exist");
  // }
  await DatabaseHelper.instance.database;

  bool dbExists = await checkDatabase(DatabaseConstants.dbName);
  if (dbExists) {
    print("Database already exists");
  } else {
    print("Database does not exist");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UpToDo App',
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
