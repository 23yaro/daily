import 'package:daily/features/home/provider_notifiers/task_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../ui/consts/colors.dart';
import '../../../ui/consts/icons.dart';
import '../../../utils/s/s.dart';
import '../provider_notifiers/task_notifier.dart';

class TaskDeleteButton extends StatelessWidget {
  const TaskDeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final listNotifier = context.read<TaskListNotifier>();

    final taskNotifier = context.watch<TaskNotifier>();

    final icon =
        taskNotifier.isNewTask ? IconsApp.deleteDisabled : IconsApp.delete;

    void onPressed() {
      listNotifier.deleteTask(taskNotifier.task.id);
      context.pop();
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        onPressed: taskNotifier.isNewTask ? null : onPressed,
        style: TextButton.styleFrom(foregroundColor: ColorsApp.red),
        icon: icon,
        label: Text(context.strings().taskDelete),
      ),
    );
  }
}
