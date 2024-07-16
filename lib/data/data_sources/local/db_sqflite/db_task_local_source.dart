import 'package:daily/data/data_sources/local/task_local_source.dart';

import '../../../../utils/logger/logger.dart';
import '../../../dto/task_dto.dart';
import '../task_data_base.dart';

class TaskDBLocalSource implements TaskLocalSource {
  TaskDBLocalSource({
    required TaskDataBase dataBase,
  }) : _dataBase = dataBase;
  final TaskDataBase _dataBase;

  @override
  Future<void> addTask(TaskDTO task) async {
    try {
      await _dataBase.addTask(task);
      logger.d('TaskLocalSource: add task');
    } catch (error, stackTrace) {
      logger.e(
        "TaskLocalSource failed: addCachedTask",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<TaskDTO> getTask(String id) async {
    TaskDTO? task;
    try {
      task = await _dataBase.getTask(id);
      logger.d('TaskLocalSource: get task');
    } catch (error, stackTrace) {
      logger.e(
        "TaskLocalSource failed: getCachedTaskById",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
    return task;
  }

  @override
  Future<void> deleteTask(String id) async {
    try {
      await _dataBase.deleteTask(id);
      logger.d('TaskLocalSource: deleted task');
    } catch (error, stackTrace) {
      logger.e(
        "TaskLocalSource failed: deleteCachedTaskById",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<List<TaskDTO>> getTaskList() async {
    List<TaskDTO> tasks;
    try {
      tasks = await _dataBase.getTaskList();
      logger.d('TaskLocalSource: get task list');
    } catch (error, stackTrace) {
      logger.e(
        "TaskLocalSource failed: getCachedTaskList",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }

    return tasks;
  }

  @override
  Future<void> saveTaskList(List<TaskDTO> list) async {
    try {
      await _dataBase.saveTaskList(list);
      logger.d('TaskLocalSource: task saved');
    } catch (error, stackTrace) {
      logger.e(
        "TaskLocalSource failed: saveTaskList",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> updateTask(TaskDTO task) async {
    try {
      await _dataBase.updateTask(task);
      logger.d('TaskLocalSource: task updated');
    } catch (error, stackTrace) {
      logger.e(
        "TaskLocalSource failed: updateCachedTask",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
