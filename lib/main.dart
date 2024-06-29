import 'package:daily/data/data_sources/local/sqflite_db/database.dart';
import 'package:daily/data/data_sources/local/sqflite_db/db_task_local_source.dart';
import 'package:daily/domain/task_usecase/task_usecase.dart';
import 'package:daily/ui/theme/theme.dart';
import 'package:daily/utils/logger/logger.dart';
import 'package:daily/utils/s/s.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/data_repository/task_data_repository.dart';
import 'data/data_sources/remote/api/api_client.dart';
import 'data/data_sources/remote/api/api_task_remote_source.dart';
import 'domain/repository/task_repository.dart';
import 'features/Home/home_screen.dart';
import 'features/home/provider_notifiers/task_list_notifier.dart';
import 'features/task_edit/task_screen.dart';

void main() async {
  logger.i('Logger?');
  WidgetsFlutterBinding.ensureInitialized();
  TaskRepository repository = await initRepository();
  runApp(MyApp(repository: repository));
}

Future<TaskRepository> initRepository() async {
  SQFLDataBase dataBase = SQFLDataBase();
  await dataBase.init();
  TaskDataRepository repo = TaskDataRepository(
    remoteSource: TaskApiRemoteSource(
      apiService: ApiClient.instance.apiService,
      currentRevision: ApiClient.instance.revisionHolder,
    ),
    localSource: TaskDBLocalSource(dataBase: dataBase),
  );
  return repo;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.repository});

  final TaskRepository repository;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskListNotifier>(
      create: (_) => TaskListNotifier(TaskUseCase(repository))..loadTasks(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Daily',
        theme: ThemeApp.lightTheme,
        supportedLocales: S.supportedLocales,
        locale: S.locale,
        localizationsDelegates: S.localizationDelegates,
        initialRoute: '/',
        routes: {
          HomeScreen.routeName(): (context) => const HomeScreen(),
          TaskScreen.routeName(): (context) => const TaskScreen(),
        },
      ),
    );
  }
}
