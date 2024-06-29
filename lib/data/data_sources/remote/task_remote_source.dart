import '../../dto/task_dto.dart';

abstract class TaskRemoteSource {
  Future<List<TaskDto>> getTaskList();
  Future<List<TaskDto>> updateTaskList(List<TaskDto> list);
  Future<TaskDto> addTask(TaskDto task);
  Future<TaskDto> getTaskById(String id);
  Future<TaskDto> updateTask(TaskDto task);
  Future<TaskDto> deleteTaskById(String id);
}