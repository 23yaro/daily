import 'package:flutter/material.dart';

class HomeNewTaskButton extends StatelessWidget {
  const HomeNewTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 49.0, bottom: 15.0),
        child: TextButton(
          child: Text('Новое', style: Theme.of(context).textTheme.bodySmall),
          onPressed: () => Navigator.pushNamed(context, '/task_screen'),
        ),
      ),
    );
  }
}
