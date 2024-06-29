import 'package:daily/domain/model/task_model.dart';
import 'package:daily/domain/repository/task_repository.dart';

import '../moc_list.dart';

class TaskDataRepository implements TaskRepository {
  final Moc _moc = Moc();

  @override
  Future<bool> addTask(Task task) {
    _moc.items.add(task);
    return Future.value(true);
  }

  @override
  Future<bool> deleteTask(String id) {
    _moc.items.removeWhere((e) => e.id == id);
    return Future.value(true);
  }

  @override
  Future<Task> getTask(String id) {
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getTaskList() {
    return Future.value(_moc.items);
  }

  @override
  Future<bool> updateTask(Task updatedTask) {
    final index = _moc.items.indexWhere((e) => e.id == updatedTask.id);
    if (index != -1) {
      _moc.items[index] = updatedTask;
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  Future<bool> updateTaskList(List<Task> list) {
    // TODO: implement updateTaskList
    throw UnimplementedError();
  }
}
