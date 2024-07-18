import 'package:daily/features/home/provider_notifiers/task_list_notifier.dart';
import 'package:daily/features/home/widgets/list/home_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_list_wrapper.dart';

class HomeBodyList extends StatelessWidget {
  const HomeBodyList({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<TaskListNotifier>();

    return ListWrapper(
      sliver: notifier.isLoading
          ? const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : const HomeList(),
    );
  }
}
