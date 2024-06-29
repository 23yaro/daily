import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../ui/consts/icons.dart';
import '../../../utils/s/s.dart';
import '../../home/provider_notifiers/task_list_notifier.dart';
import '../provider_notifiers/task_notifier.dart';

class TaskAppBar extends StatelessWidget {
  const TaskAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final listNotifier = context.read<TaskListNotifier>();

    final taskNotifier = context.watch<TaskNotifier>();

    void close() => Navigator.pop(context);

    void saveTask() {
      if (taskNotifier.isNewTask) {
        listNotifier.addTask(taskNotifier.task);
      } else {
        listNotifier.updateTask(taskNotifier.task);
      }
      close();
    }

    return SliverAppBar(
      pinned: true,
      leading: IconButton(
        onPressed: close,
        icon: IconsApp.close,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: TextButton(
            onPressed: taskNotifier.text == '' ? null : saveTask,
            child: Text(S.of(context).taskAppBarSave),
          ),
        )
      ],
    );
  }
}
