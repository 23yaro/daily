import '../model/task_model.dart';

abstract class TaskRepository {
  Future<List<Task>> getTaskList();

  Future<bool> updateTaskList(List<Task> list);

  Future<Task?> getTask(String id);

  Future<bool> addTask(Task task);

  Future<bool> updateTask(Task updatedTask);

  Future<bool> deleteTask(String id);
}
