import 'package:flutter/material.dart';

import '../../../../utils/s/s.dart';

class HomeNewTaskButton extends StatelessWidget {
  const HomeNewTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 47.0, bottom: 5.0),
        child: TextButton(
          child: Text(
            S.of(context).homeNew,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
          ),
          onPressed: () => Navigator.pushNamed(context, '/task_screen'),
        ),
      ),
    );
  }
}
