import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

    void close() => context.pop();

    void saveTask() async {
      taskNotifier.isNewTask
          ? await listNotifier.addTask(taskNotifier.task)
          : await listNotifier.updateTask(taskNotifier.task);
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
            key: const ValueKey('save_button'),
            onPressed: taskNotifier.text == '' ? null : saveTask,
            child: Text(context.strings().taskAppBarSave),
          ),
        )
      ],
    );
  }
}
