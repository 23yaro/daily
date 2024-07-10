import '../../dto/task_dto.dart';

abstract class TaskLocalSource {
  Future<List<TaskDto>> getTaskList();
  Future<void> saveTaskList(List<TaskDto> list);
  Future<TaskDto> getTask(String id);
  Future<void> addTask(TaskDto task);
  Future<void> updateTask(TaskDto task);
  Future<void> deleteTask(String id);
}
