import 'dart:io';

import 'package:daily/data/mappers/task_mappers.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../utils/logger/logger.dart';
import '../../../dto/task_dto.dart';
import '../task_data_base.dart';

class SQFLDataBase implements TaskDataBase {
  static const String tableName = 'tasks';
  final int _version = 1;
  late final Database _db;

  Future<void> init() async {
    String path = await getDatabasesPath();
    _db = await openDatabase(
      "$path${Platform.pathSeparator}$tableName",
      version: _version,
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE IF NOT EXISTS $tableName ('
            'id TEXT PRIMARY KEY,'
            'text TEXT NOT NULL,'
            'importance TEXT NOT NULL,'
            'deadline INTEGER,'
            'done INTEGER NOT NULL,'
            'color TEXT,'
            'created_at INTEGER NOT NULL,'
            'changed_at INTEGER NOT NULL,'
            'last_updated_by TEXT NOT NULL)');
      },
    );
  }

  @override
  Future<void> addTask(TaskDTO taskDto) async {
    await _db.insert(
      tableName,
      taskDto.toDbJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<TaskDTO> getTask(String id) async {
    try {
      List<Map> result = await _db.query(
        tableName,
        where: "id = ?",
        whereArgs: [id],
      );
      return TaskDTO.fromDbJson(result.first as Map<String, dynamic>);
    } catch (error, stackTrace) {
      logger.e(
        "Database failed to get task",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<List<TaskDTO>> getTaskList() async {
    try {
      List<Map<String, dynamic>> result = await _db.query(tableName);
      return result.map((t) => TaskDTO.fromDbJson(t)).toList();
    } catch (error, stackTrace) {
      logger.e(
        "Database failed to get all tasks",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> saveTaskList(List<TaskDTO> tasks) async {
    _db.delete(tableName);
    final batch = _db.batch();
    for (var task in tasks) {
      batch.insert(
        tableName,
        task.toDbJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  }

  @override
  Future<void> deleteTask(String id) async {
    await _db.delete(tableName, where: "id = ?", whereArgs: [id]);
  }

  @override
  Future<void> updateTask(TaskDTO task) async {
    await _db.update(
      tableName,
      task.toDbJson(),
      where: "id = ?",
      whereArgs: [task.id],
    );
  }
}
