import 'package:daily/features/task_edit/widgets/selectors/task_date_selector.dart';
import 'package:daily/features/task_edit/widgets/selectors/task_priority_selector.dart';
import 'package:daily/features/task_edit/widgets/task_appbar.dart';
import 'package:daily/features/task_edit/widgets/task_delete_button.dart';
import 'package:daily/features/task_edit/widgets/task_text_field.dart';
import 'package:flutter/material.dart';

class TaskBody extends StatelessWidget {
  const TaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    final sliverList = SliverList.list(
      children: const [
        TaskTextField(),
        TaskPrioritySelector(),
        Divider(
          indent: 15,
          endIndent: 15,
          thickness: 0.2,
        ),
        TaskDateSelector(),
        Divider(
          thickness: 0.2,
          height: 25.0,
        ),
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
