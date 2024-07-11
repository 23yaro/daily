import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/model/task_model.dart';
import '../../../../ui/consts/colors.dart';
import '../../../../utils/s/s.dart';
import '../../provider_notifiers/task_notifier.dart';

class TaskPrioritySelector extends StatefulWidget {
  const TaskPrioritySelector({super.key});

  @override
  State<TaskPrioritySelector> createState() => _TaskPrioritySelectorState();
}

class _TaskPrioritySelectorState extends State<TaskPrioritySelector> {
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<TaskNotifier>();

    final priorityNone = context.strings().taskPriorityDefault;

    final priorityLow = context.strings().taskPriorityLow;

    final priorityHigh = context.strings().taskPriorityHigh;

    final items = [
      DropdownMenuItem<Importance>(
        key: const ObjectKey(Importance.none),
        value: Importance.none,
        child: Text(
          priorityNone,
        ),
      ),
      DropdownMenuItem<Importance>(
        key: const ObjectKey(Importance.low),
        value: Importance.low,
        child: Text(
          priorityLow,
          style: const TextStyle(color: ColorsApp.gray),
        ),
      ),
      DropdownMenuItem<Importance>(
        key: const ObjectKey(Importance.high),
        value: Importance.high,
        child: Text(
          priorityHigh,
          style: const TextStyle(color: ColorsApp.red),
        ),
      ),
    ];

    void onChanged(Importance? newValue) =>
        newValue == null ? null : notifier.importance = newValue;

    return ListTile(
      title: Text(context.strings().taskPriority),
      subtitle: Align(
        alignment: Alignment.centerLeft,
        child: DropdownButton(
          underline: const SizedBox(),
          style: Theme.of(context).textTheme.bodySmall,
          icon: const Icon(null),
          value: notifier.importance,
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
