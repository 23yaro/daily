import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider_notifiers/task_list_notifier.dart';
import '../list_item/home_list_item.dart';
import 'home_list_new_task_button.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<TaskListNotifier>();

    final tasks = notifier.visibility
        ? notifier.tasks.where((task) => !task.done).toList()
        : notifier.tasks.toList();

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => (index != tasks.length)
            ? HomeListItem(task: tasks[index])
            : const HomeNewTaskButton(),
        childCount: tasks.length + 1,
      ),
    );
  }
}
