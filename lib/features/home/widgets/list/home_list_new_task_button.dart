import 'package:daily/features/task_edit/task_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/s/s.dart';

class HomeNewTaskButton extends StatelessWidget {
  const HomeNewTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    void onPressed() => context.goNamed(TaskScreen.routeName());

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 47.0, bottom: 5.0),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            context.strings().homeNew,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Theme.of(context).colorScheme.tertiary),
          ),
        ),
      ),
    );
  }
}
