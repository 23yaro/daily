import 'package:daily/features/Task/widgets/task_body.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TaskBody(),
    );
  }
}
