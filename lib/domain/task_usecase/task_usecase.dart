import '../model/task_model.dart';
import '../repository/task_repository.dart';

class TaskUseCase {
  TaskUseCase(this._repository);

  final TaskRepository _repository;

  Future<bool> addTask(Task task) async {
    return await _repository.addTask(task);
  }

  Future<bool> deleteTask(String id) async {
    return await _repository.deleteTask(id);
  }

  Future<Task> getTask(String id) async {
    Task task = await _repository.getTask(id);
    return task;
  }

  Future<List<Task>> getTaskList() async {
    return await _repository.getTaskList();
  }

  Future<bool> updateTask(Task task) async {
    return await _repository.updateTask(task);
  }

  Future<bool> updateTaskList(List<Task> taskList) async {
    return await _repository.updateTaskList(taskList);
  }
}
