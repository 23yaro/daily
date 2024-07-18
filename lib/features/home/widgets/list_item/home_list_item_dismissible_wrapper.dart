import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/model/task_model.dart';
import '../../../../ui/consts/colors.dart';
import '../../../../ui/consts/icons.dart';
import '../../provider_notifiers/task_list_notifier.dart';

class DismissibleWrapper extends StatelessWidget {
  const DismissibleWrapper({
    super.key,
    required this.task,
    required this.child,
  });

  final Task task;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 400);

    final notifier = context.watch<TaskListNotifier>();

    Future<void> completeTask() async {
      await notifier.updateTask(task..complete());
      FirebaseAnalytics.instance.logEvent(name: "complete_task");
    }

    Future<void> deleteTask() async {
      await notifier.deleteTask(task.id);
      FirebaseAnalytics.instance.logEvent(name: "delete_task");
    }

    Future<bool> confirmDismiss(DismissDirection direction) async {
      if (direction == DismissDirection.startToEnd) {
        if (notifier.visibility) {
          return true;
        } else {
          await completeTask();
          return false;
        }
      }
      return true;
    }

    void onDismissed(DismissDirection direction) {
      if (direction == DismissDirection.startToEnd) {
        completeTask();
      }
      if (direction == DismissDirection.endToStart) {
        deleteTask();
      }
    }

    Widget background = AnimatedContainer(
      duration: duration,
      alignment: Alignment.centerLeft,
      color: task.done ? ColorsApp.gray : ColorsApp.green,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: task.done ? IconsApp.close : IconsApp.check,
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Dismissible(
        movementDuration: duration,
        confirmDismiss: confirmDismiss,
        onDismissed: onDismissed,
        key: ValueKey(task),
        background: background,
        secondaryBackground: Container(
          alignment: Alignment.centerRight,
          color: ColorsApp.red,
          child: const Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: IconsApp.deleteDef,
          ),
        ),
        child: child,
      ),
    );
  }
}
