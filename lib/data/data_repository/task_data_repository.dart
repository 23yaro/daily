import 'package:daily/domain/model/task_model.dart';
import 'package:daily/domain/repository/task_repository.dart';

import '../../utils/logger/logger.dart';
import '../data_sources/local/task_local_source.dart';
import '../data_sources/remote/task_remote_source.dart';
import '../dto/task_dto.dart';

class TaskDataRepository implements TaskRepository {
  TaskDataRepository({
    required TaskRemoteSource remoteSource,
    required TaskLocalSource localSource,
  })  : _remoteSource = remoteSource,
        _localSource = localSource;

  final TaskRemoteSource _remoteSource;

  final TaskLocalSource _localSource;

  @override
  Future<bool> addTask(Task task) async {
    logger.d("Data repository: addTask");
    try {
      TaskDto taskDto = await _remoteSource.addTask(task.toTaskDto());
      await _localSource.addTask(taskDto);
      return true;
    } catch (error, stackTrace) {
      logger.e("Data repository: failed to add task",
          error: error, stackTrace: stackTrace);
      return false;
    }
  }

  @override
  Future<Task> getTask(String id) async {
    logger.d("Data repository: getTask");
    try {
      TaskDto taskDto = await _remoteSource.getTaskById(id);
      await _localSource.updateTask(taskDto);
      return taskDto.toTask();
    } catch (error, stackTrace) {
      logger.e(
        "Data repository: failed to get task",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<bool> updateTask(Task updatedTask) async {
    logger.d("Data repository: updateTask");
    try {
      TaskDto taskDto = await _remoteSource.updateTask(updatedTask.toTaskDto());
      await _localSource.updateTask(taskDto);
      return true;
    } catch (error, stackTrace) {
      logger.e(
        "Data repository: failed to update task list",
        error: error,
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  @override
  Future<bool> deleteTask(String id) async {
    logger.d("Data repository: deleteTask");
    try {
      await _remoteSource.deleteTaskById(id);
      await _localSource.deleteTask(id);
      return true;
    } catch (error, stackTrace) {
      logger.e(
        "Data repository: failed to delete task",
        error: error,
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  @override
  Future<List<Task>> getTaskList() async {
    logger.d("Data repository: getTaskList");
    try {
      List<TaskDto> taskList = await _remoteSource.getTaskList();
      await _localSource.saveTaskList(taskList);
      List<TaskDto> cachedTasks = await _localSource.getTaskList();
      return cachedTasks.map((e) => e.toTask()).toList();
    } catch (error, stackTrace) {
      logger.e(
        "Data repository: failed to receive task list",
        error: error,
        stackTrace: stackTrace,
      );
      throw Exception("Data repository: error receiving task list");
    }
  }

  @override
  Future<bool> updateTaskList(List<Task> list) async {
    logger.d("Data repository: updateTaskList");
    try {
      List<TaskDto> tasksDto = await _remoteSource
          .updateTaskList(list.map((t) => t.toTaskDto()).toList());
      await _localSource.saveTaskList(tasksDto);
      return true;
    } catch (error, stackTrace) {
      logger.e(
        "Data repository: failed to update task list",
        error: error,
        stackTrace: stackTrace,
      );
      return false;
    }
  }
}
