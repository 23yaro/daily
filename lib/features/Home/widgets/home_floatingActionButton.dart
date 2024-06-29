import 'package:daily/ui/consts/icons.dart';
import 'package:flutter/material.dart';

class FABApp extends StatelessWidget {
  const FABApp({super.key});

  @override
  Widget build(BuildContext context) {
    void onPressed() => Navigator.pushNamed(context, '/task_screen');

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: FloatingActionButton(
        onPressed: onPressed,
        child: IconsApp.add,
      ),
    );
  }
}
