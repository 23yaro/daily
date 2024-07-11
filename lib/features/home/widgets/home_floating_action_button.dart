import 'package:daily/features/task_edit/task_screen.dart';
import 'package:daily/ui/consts/icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FABApp extends StatelessWidget {
  const FABApp({super.key});

  @override
  Widget build(BuildContext context) {
    void onPressed() => context.go(TaskScreen.routeName());

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: FloatingActionButton(
        onPressed: onPressed,
        child: IconsApp.add,
      ),
    );
  }
}
