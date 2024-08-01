import 'package:daily/features/task_edit/provider_notifiers/task_notifier.dart';
import 'package:daily/features/task_edit/widgets/task_body.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/model/task_model.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key, required this.task});

  final Task? task;

  static String routeName() => '/task_screen';

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics.instance.logScreenView(
      screenClass: "TaskScreen",
      screenName: "Task edit screen",
    );
    return ChangeNotifierProvider(
      create: (BuildContext context) => task == null
          ? TaskNotifier(task: Task(text: ''), isNewTask: true)
          : TaskNotifier(task: task!.copyWith(), isNewTask: false),
      child: const Scaffold(
        body: TaskBody(),
      ),
    );
  }
}
