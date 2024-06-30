import 'dart:convert';

import 'package:daily/data/data_sources/remote/api/api_revision.dart';
import 'package:daily/data/data_sources/remote/api/responses/api_response.dart';
import 'package:daily/data/data_sources/remote/api/service/api_service.dart';
import 'package:daily/data/data_sources/remote/task_remote_source.dart';
import 'package:daily/data/dto/task_dto.dart';

import '../../../../utils/logger/logger.dart';

class TaskApiRemoteSource implements TaskRemoteSource {
  TaskApiRemoteSource({
    required ApiService apiService,
    required this.currentRevision,
  }) : _apiService = apiService;

  final ApiService _apiService;
  final CurrentRevision currentRevision;

  @override
  Future<TaskDto> addTask(TaskDto task) async {
    try {
      TaskResponse response = await _apiService.createTask({
        "element": task.toJson(),
      });
      currentRevision.revision = response.revision;
      return TaskDto.fromJson(response.element);
    } catch (error, stackTrace) {
      logger.e(
        "TaskApiRemoteSource failed: create task",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<TaskDto> getTaskById(String id) async {
    try {
      TaskResponse response = await _apiService.getById(id);
      currentRevision.revision = response.revision;
      return TaskDto.fromJson(response.element);
    } catch (error, stackTrace) {
      logger.e(
        "TaskApiRemoteSource failed: to get task!",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<TaskDto> updateTask(TaskDto task) async {
    try {
      TaskResponse response = await _apiService.updateTask(
        task.id,
        {
          "element": task.toJson(),
        },
      );
      currentRevision.revision = response.revision;
      return TaskDto.fromJson(response.element);
    } catch (error, stackTrace) {
      logger.e(
        "TaskApiRemoteSource failed: to update task!",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<TaskDto> deleteTaskById(String id) async {
    try {
      TaskResponse response = await _apiService.deleteTask(id);
      currentRevision.revision = response.revision;
      return TaskDto.fromJson(response.element);
    } catch (error, stackTrace) {
      logger.e(
        "TaskApiRemoteSource failed: to delete task!",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<List<TaskDto>> getTaskList() async {
    try {
      TasksListResponse response = await _apiService.getAll();
      currentRevision.revision = response.revision;
      List<TaskDto> taskDtos = response.list
          .map(
            (m) => TaskDto.fromJson(m),
          )
          .toList();
      return taskDtos;
    } catch (error, stackTrace) {
      logger.e(
        "TaskApiRemoteSource failed: to get list of tasks",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<List<TaskDto>> updateTaskList(List<TaskDto> list) async {
    try {
      TasksListResponse response =
          await _apiService.updateAll({"list": jsonEncode(list)});
      currentRevision.revision = response.revision;
      List<TaskDto> taskDtos = response.list
          .map(
            (m) => TaskDto.fromJson(m),
          )
          .toList();
      return taskDtos;
    } catch (error, stackTrace) {
      logger.e(
        "TaskApiRemoteSource failed: to update task list!",
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
