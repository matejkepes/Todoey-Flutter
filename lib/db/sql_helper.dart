import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:todoey_flutter/constants/db_constants.dart';
import 'package:todoey_flutter/model/task.dart';

/// This is helper class for performing CRUD operations using SQFLite package
/// And also creating & using databases and tables
class SQLHelper {
  /// Create/Use Table
  static Future<void> createTables(Database database) async {
    await database.execute("""CREATE TABLE ${DBConstants.tableName}(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    description TEXT,
    isComplete BOOLEAN NOT NULL,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )""");
  }

  /// Create/Use DB
  static Future<Database> getDb() async {
    return openDatabase(DBConstants.dbName, version: 1,
        onCreate: (Database database, int version) async {
      await createTables(database);
    });
  }

  /// Create
  static Future<int> insertItem(Task task) async {
    final db = await SQLHelper.getDb();

    final data = task.toMap();
    final id = await db.insert(
      DBConstants.tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
    return id;
  }

  /// Read
  static Future<List<Task>> getAllItems() async {
    final db = await SQLHelper.getDb();

    List<Task> tasksList = [];
    await db.query(DBConstants.tableName, orderBy: 'id').then((value) {
      for (Map<String, dynamic> item in value) {
        tasksList.add(Task.fromMap(item));
      }
    });
    return tasksList;
  }

  /// Delete
  static Future<void> deleteTask(int id) async {
    final db = await SQLHelper.getDb();

    try {
      await db.delete(
        DBConstants.tableName,
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (err) {
      log("Something went wrong while deleting an item: Error: $err");
    }
  }

  /// Update
  static Future<int> updateTask(Task task) async {
    final db = await SQLHelper.getDb();
    final data = task.toMap();

    final result = await db.update(
      DBConstants.tableName,
      data,
      where: "id = ?",
      whereArgs: [task.id],
    );
    return result;
  }
}
