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

    final priorityNone = S.of(context).taskPriorityDefault;

    final priorityLow = S.of(context).taskPriorityLow;

    final priorityHigh = S.of(context).taskPriorityHigh;

    final items = [
      DropdownMenuItem<Importance>(
        value: Importance.none,
        child: Text(
          priorityNone,
        ),
      ),
      DropdownMenuItem<Importance>(
        value: Importance.low,
        child: Text(
          priorityLow,
          style: const TextStyle(color: ColorsApp.labelPrimary),
        ),
      ),
      DropdownMenuItem<Importance>(
        value: Importance.high,
        child: Text(
          priorityHigh,
          style: const TextStyle(color: ColorsApp.red),
        ),
      ),
    ];

    void onChanged(Importance? newValue) {
      if (newValue == null) {
        return;
      } else {
        notifier.importance = newValue;
      }
    }

    return ListTile(
      title: Text(S.of(context).taskPriority),
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
