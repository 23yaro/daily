import 'package:flutter/material.dart';

import '../../../domain/model/task_model.dart';
import '../../../domain/task_usecase/task_usecase.dart';
import '../../../utils/logger/logger.dart';

class TaskListNotifier extends ChangeNotifier {
  TaskListNotifier(this._taskUseCase);

  final TaskUseCase _taskUseCase;

  List<Task> tasks = [];

  bool visibility = true;

  void changeVisibility() {
    visibility = !visibility;
    notifyListeners();
  }

  void loadTasks() async {
    tasks.addAll(await _taskUseCase.getTaskList());
    logger.i('task loaded');
  }

  Future<bool> addTask(Task task) async {
    final result = await _taskUseCase.addTask(task);
    if (result) {
      tasks.add(task);
      notifyListeners();
      logger.d('task added and uploaded List length: ${tasks.length}');
    } else {
      logger.e('add task error');
    }
    return result;
  }

  Future<bool> updateTask(Task task) async {
    final result = await _taskUseCase.updateTask(task);
    if (result) {
      logger.d('task updated');
      tasks[tasks.indexWhere((e) => e.id == task.id)] = task;
      notifyListeners();
    } else {
      logger.e('update task error');
    }
    return result;
  }

  Future<bool> deleteTask(String id) async {
    final result = await _taskUseCase.deleteTask(id);
    if (result) {
      tasks.removeWhere((e) => e.id == id);
      notifyListeners();
      logger.d('Task deleted. List length: ${tasks.length}');
    } else {
      logger.e('delete task error');
    }
    return result;
  }
}
