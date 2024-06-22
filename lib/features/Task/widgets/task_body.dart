import 'package:daily/features/Task/widgets/task_appbar.dart';
import 'package:daily/features/Task/widgets/task_date_selector.dart';
import 'package:daily/features/Task/widgets/task_delete_button.dart';
import 'package:daily/features/Task/widgets/task_priority_selector.dart';
import 'package:daily/features/Task/widgets/task_text_field.dart';
import 'package:flutter/material.dart';

class TaskBody extends StatelessWidget {
  const TaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    final sliverList = SliverList.list(
      children: const [
        TaskTextField(),
        TaskPrioritySelector(),
        TaskDateSelector(),
        TaskDeleteButton(),
      ],
    );

    return CustomScrollView(
      slivers: [
        const TaskAppBar(),
        sliverList,
      ],
    );
  }
}
