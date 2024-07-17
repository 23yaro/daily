import 'package:daily/domain/task_usecase/task_usecase.dart';
import 'package:daily/features/navigator/router.dart';
import 'package:daily/ui/theme/theme.dart';
import 'package:daily/utils/logger/logger.dart';
import 'package:daily/utils/s/s.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'di/di_container.dart';
import 'features/home/provider_notifiers/task_list_notifier.dart';
import 'firebase_options.dart';

void main() async {
  logger.i('Logger?');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupGetIt();
  await GetIt.I.allReady();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics.instance.logScreenView(
      screenClass: "HomeScreen",
      screenName: "Main page",
    );

    return ChangeNotifierProvider<TaskListNotifier>(
      create: (_) => TaskListNotifier(
        taskUseCase: GetIt.I.get<TaskUseCase>(),
      )..loadTasks(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Daily',
        theme: ThemeApp.lightTheme,
        darkTheme: ThemeApp.darkTheme,
        supportedLocales: S.supportedLocales,
        locale: S.locale,
        localizationsDelegates: S.localizationDelegates,
        routerConfig: router,
      ),
    );
  }
}
