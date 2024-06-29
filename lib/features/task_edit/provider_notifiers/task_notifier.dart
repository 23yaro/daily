import 'package:flutter/material.dart';

import '../../../domain/model/task_model.dart';

class TaskNotifier extends ChangeNotifier {
  TaskNotifier({
    required this.task,
    required this.isNewTask,
  });

  final Task task;

  bool isNewTask;

  String get text => task.text;

  set text(String text) {
    task.text = text;
    notifyListeners();
  }

  Importance get importance => task.importance;

  set importance(Importance importance) {
    task.importance = importance;
    notifyListeners();
  }

  String? get deadline => task.deadline;

  set deadline(String? deadline) {
    task.deadline = deadline;
    notifyListeners();
  }
}
