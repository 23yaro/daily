import 'package:daily/ui/theme/theme.dart';
import 'package:flutter/material.dart';

import 'features/Home/home_screen.dart';
import 'features/Task/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily',
      theme: lightTheme,
      initialRoute: '/task_screen',
      routes: {
        '/': (context) => const HomeScreen(),
        '/task_screen': (context) => const TaskScreen(),
      },
    );
  }
}
