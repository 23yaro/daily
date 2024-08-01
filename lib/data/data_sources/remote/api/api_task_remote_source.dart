import 'package:daily/data/data_sources/remote/api/api_revision.dart';
import 'package:daily/data/data_sources/remote/api/responses/api_response.dart';
import 'package:daily/data/data_sources/remote/api/service/api_service.dart';
import 'package:daily/data/data_sources/remote/task_remote_source.dart';
import 'package:daily/data/dto/task_dto.dart';
import 'package:daily/data/mappers/task_mappers.dart';

import '../../../../utils/logger/logger.dart';

class TaskApiRemoteSource implements TaskRemoteSource {
  TaskApiRemoteSource({
    required ApiService apiService,
    required AppRevision appRevision,
  })  : _apiService = apiService,
        _appRevision = appRevision;
  final ApiService _apiService;

  final AppRevision _appRevision;

  @override
  Future<TaskDTO> addTask(TaskDTO task) async {
    TaskDTO taskDTO;
    try {
      TaskResponse response = await _apiService.createTask(task.toApiJson());
      await _appRevision.set(response.revision);
      taskDTO = TaskDTO.fromJson(response.element);
    } catch (error, stackTrace) {
      logger.e(
        "TaskApiRemoteSource failed: create task",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
    return taskDTO;
  }

  @override
  Future<TaskDTO> getTaskById(String id) async {
    TaskDTO taskDTO;
    try {
      TaskResponse response = await _apiService.getById(id);
      taskDTO = TaskDTO.fromJson(response.element);
      await _appRevision.set(response.revision);
    } catch (error, stackTrace) {
      logger.e(
        "TaskApiRemoteSource failed: to get task!",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
    return taskDTO;
  }

  @override
  Future<TaskDTO> updateTask(TaskDTO task) async {
    TaskDTO taskDTO;
    try {
      TaskResponse response = await _apiService.updateTask(
        task.id,
        task.toApiJson(),
      );
      await _appRevision.set(response.revision);
      logger.d(response.revision);
      taskDTO = TaskDTO.fromJson(response.element);
    } catch (error, stackTrace) {
      logger.e(
        "TaskApiRemoteSource failed: to update task!",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
    return taskDTO;
  }

  @override
  Future<TaskDTO> deleteTaskById(String id) async {
    TaskDTO taskDTO;
    try {
      TaskResponse response = await _apiService.deleteTask(id);
      await _appRevision.set(response.revision);
      taskDTO = TaskDTO.fromJson(response.element);
    } catch (error, stackTrace) {
      logger.e(
        "TaskApiRemoteSource failed: to delete task!",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
    return taskDTO;
  }

  @override
  Future<List<TaskDTO>> getTaskList() async {
    List<TaskDTO> taskDTOsList;
    try {
      TasksListResponse response = await _apiService.getAll();
      logger.d('current revision ${response.revision}');
      if (_appRevision.revision < response.revision) {
        await _appRevision.set(response.revision);
        taskDTOsList = response.list
            .map(
              (m) => TaskDTO.fromJson(m),
            )
            .toList();
      } else {
        throw Exception(
            'TaskApiRemoteSource exception: current revision > remote revision');
      }
    } catch (error, stackTrace) {
      logger.e(
        "TaskApiRemoteSource failed: to get list of tasks",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
    return taskDTOsList;
  }

  @override
  Future<List<TaskDTO>> updateTaskList(List<TaskDTO> list) async {
    List<TaskDTO> taskDTOs;
    try {
      TasksListResponse response = await _apiService.updateAll(
        {
          "list": [
            ...list.map((t) => t.toJson()),
          ]
        },
      );
      await _appRevision.set(response.revision);
      taskDTOs = response.list
          .map(
            (m) => TaskDTO.fromJson(m),
          )
          .toList();
    } catch (error, stackTrace) {
      logger.e(
        "TaskApiRemoteSource failed: to update task list!",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
    return taskDTOs;
  }
}
