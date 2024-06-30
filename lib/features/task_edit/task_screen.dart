import 'package:daily/features/task_edit/provider_notifiers/task_notifier.dart';
import 'package:daily/features/task_edit/widgets/task_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/model/task_model.dart';
import '../home/provider_notifiers/task_list_notifier.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  static String routeName() => '/task_screen';

  @override
  Widget build(BuildContext context) {
    late final Task task;

    late final bool isNewTask;

    final id = ModalRoute.of(context)?.settings.arguments as String?;

    if (id == null) {
      task = Task(text: '');
      isNewTask = true;
    } else {
      task = context
          .read<TaskListNotifier>()
          .tasks
          .firstWhere((task) => task.id == id)
          .copyWith();
      isNewTask = false;
    }

    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          TaskNotifier(task: task, isNewTask: isNewTask),
      child: const Scaffold(
        body: TaskBody(),
      ),
    );
  }
}
