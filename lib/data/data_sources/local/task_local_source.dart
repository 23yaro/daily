import '../../dto/task_dto.dart';

abstract class TaskLocalSource {
  Future<void> addTask(TaskDTO task);

  Future<TaskDTO> getTask(String id);

  Future<void> updateTask(TaskDTO task);

  Future<void> deleteTask(String id);

  Future<List<TaskDTO>> getTaskList();

  Future<void> saveTaskList(List<TaskDTO> list);
}
