import '../../dto/task_dto.dart';

abstract class TaskRemoteSource {
  Future<List<TaskDTO>> getTaskList();

  Future<List<TaskDTO>> updateTaskList(List<TaskDTO> list);

  Future<TaskDTO> addTask(TaskDTO task);

  Future<TaskDTO> getTaskById(String id);

  Future<TaskDTO> updateTask(TaskDTO task);

  Future<TaskDTO> deleteTaskById(String id);
}
