import 'package:daily/data/mappers/task_mappers.dart';
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
      _remoteSource.addTask(task.toTaskDto());
      await _localSource.addTask(task.toTaskDto());
      return true;
    } catch (error, stackTrace) {
      logger.e(
        "Data repository: failed to add task",
        error: error,
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  @override
  Future<Task?> getTask(String id) async {
    TaskDTO? taskDto;
    logger.d("Data repository: getTask");
    try {
      taskDto = await _localSource.getTask(id);
      taskDto ??= await _remoteSource.getTaskById(id);
    } catch (error, stackTrace) {
      logger.e(
        "Data repository: failed to get task",
        error: error,
        stackTrace: stackTrace,
      );
    }
    return taskDto?.toTask();
  }

  @override
  Future<bool> updateTask(Task updatedTask) async {
    logger.d("Data repository: updateTask");
    try {
      _remoteSource.updateTask(updatedTask.toTaskDto());
      await _localSource.updateTask(updatedTask.toTaskDto());
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
      _remoteSource.deleteTaskById(id);
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
      List<TaskDTO>? taskList = await _remoteSource.getTaskList();
      logger.d(taskList);
      if (taskList != null) {
        await _localSource.saveTaskList(taskList);
      }
      List<TaskDTO> cachedTasks = await _localSource.getTaskList();
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
    List<TaskDTO>? tasksDTOsList;
    logger.d("Data repository: updateTaskList");
    try {
      tasksDTOsList = await _remoteSource
          .updateTaskList(list.map((t) => t.toTaskDto()).toList());
      if (tasksDTOsList != null) {
        await _localSource.saveTaskList(tasksDTOsList);
      }
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
