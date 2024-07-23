import '../model/task_model.dart';
import '../repository/task_repository.dart';

class TaskUseCase {
  TaskUseCase({
    required TaskRepository repository,
  }) : _repository = repository;
  final TaskRepository _repository;

  Future<bool> callAddTask(Task task) async {
    return await _repository.addTask(task);
  }

  Future<bool> callDeleteTask(String id) async {
    return await _repository.deleteTask(id);
  }

  Future<Task?> callGetTask(String id) async {
    return await _repository.getTask(id);
  }

  Future<List<Task>> callGetTaskList() async {
    return await _repository.getTaskList();
  }

  Future<bool> callUpdateTask(Task task) async {
    return await _repository.updateTask(task);
  }

  Future<bool> callUpdateTaskList(List<Task> taskList) async {
    return await _repository.updateTaskList(taskList);
  }
}
