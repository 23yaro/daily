import '../../dto/task_dto.dart';

abstract class TaskDataBase {
  Future<void> insertTask(TaskDto task);
  Future<void> updateTask(TaskDto task);
  Future<void> deleteTask(String id);
  Future<TaskDto> getTask(String id);
  Future<List<TaskDto>> getAll();
  Future<void> saveTaskList(List<TaskDto> list);
}