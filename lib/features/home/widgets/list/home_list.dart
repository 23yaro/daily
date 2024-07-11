import 'package:daily/features/home/provider_notifiers/task_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../list_item/home_list_item.dart';
import 'home_list_new_task_button.dart';
import 'home_list_wrapper.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<TaskListNotifier>();

    final tasks = notifier.visibility
        ? notifier.tasks.where((task) => !task.done).toList()
        : notifier.tasks.toList();

    final listItems = notifier.isLoading
        ? const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => (index != tasks.length)
                  ? HomeListItem(task: tasks[index])
                  : const HomeNewTaskButton(),
              childCount: tasks.length + 1,
            ),
          );

    return ListWrapper(sliver: listItems);
  }
}
