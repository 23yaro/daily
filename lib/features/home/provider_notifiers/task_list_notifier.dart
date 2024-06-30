import 'package:flutter/material.dart';

import '../../../domain/model/task_model.dart';
import '../../../domain/task_usecase/task_usecase.dart';
import '../../../utils/logger/logger.dart';

class TaskListNotifier extends ChangeNotifier {
  TaskListNotifier(this._taskUseCase);

  final TaskUseCase _taskUseCase;

  List<Task> tasks = [];

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool visibility = true;

  void changeVisibility() {
    visibility = !visibility;
    notifyListeners();
  }

  Future<void> loadTasks() async {
    _isLoading = true;
    notifyListeners();

    try {
      tasks = await _taskUseCase.getTaskList();
    } catch (error, stackTrace) {
      logger.e(
        "TaskListNotifier: error load tasks",
        error: error,
        stackTrace: stackTrace,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> addTask(Task task) async {
    final result = await _taskUseCase.addTask(task);
    if (result) {
      tasks.add(task);
      notifyListeners();
      logger
          .d('notifier: Task added and uploaded, List length: ${tasks.length}');
    } else {
      logger.e('notifier: add task error');
    }
    return result;
  }

  Future<bool> updateTask(Task task) async {
    final result = await _taskUseCase.updateTask(task);
    if (result) {
      logger.d('notifier: task updated');
      tasks[tasks.indexWhere((e) => e.id == task.id)] = task;
      notifyListeners();
    } else {
      logger.e('notifier: update task error');
    }
    return result;
  }

  Future<bool> deleteTask(String id) async {
    final result = await _taskUseCase.deleteTask(id);
    if (result) {
      tasks.removeWhere((e) => e.id == id);
      notifyListeners();
      logger.d('notifier: Task deleted. List length: ${tasks.length}');
    } else {
      logger.e('notifier: delete task error');
    }
    return result;
  }
}
