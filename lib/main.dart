import 'package:daily/data/repository/task_data_repository.dart';
import 'package:daily/domain/task_usecase/task_usecase.dart';
import 'package:daily/ui/theme/theme.dart';
import 'package:daily/utils/logger/logger.dart';
import 'package:daily/utils/s/s.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/Home/home_screen.dart';
import 'features/home/provider_notifiers/task_list_notifier.dart';
import 'features/task_edit/task_screen.dart';

void main() {
  logger.i('Logger?');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskListNotifier>(
      create: (_) =>
          TaskListNotifier(TaskUseCase(TaskDataRepository()))..loadTasks(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Daily',
        theme: ThemeApp.lightTheme,
        supportedLocales: S.supportedLocales,
        locale: S.locale,
        localizationsDelegates: S.localizationDelegates,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/task_screen': (context) => const TaskScreen(),
        },
      ),
    );
  }
}
