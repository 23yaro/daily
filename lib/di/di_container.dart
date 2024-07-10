import 'package:daily/data/data_sources/local/task_data_base.dart';
import 'package:daily/data/data_sources/local/task_local_source.dart';
import 'package:daily/data/data_sources/remote/task_remote_source.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_repository/task_data_repository.dart';
import '../data/data_sources/local/db_sqflite/db_sqfl.dart';
import '../data/data_sources/local/db_sqflite/db_task_local_source.dart';
import '../data/data_sources/remote/api/api_client.dart';
import '../data/data_sources/remote/api/api_revision.dart';
import '../data/data_sources/remote/api/api_task_remote_source.dart';
import '../data/data_sources/remote/api/service/api_service.dart';
import '../domain/repository/task_repository.dart';
import '../domain/task_usecase/task_usecase.dart';

void setupGetIt() {
  GetIt.I.registerSingletonAsync<TaskDataBase>(
    () async {
      final db = SQFLDataBase();
      await db.init();
      return db;
    },
  );

  GetIt.I.registerSingletonAsync<SharedPreferences>(
    () async => await SharedPreferences.getInstance(),
  );

  GetIt.I.registerSingletonWithDependencies<AppRevision>(
    () => AppRevision(),
    dependsOn: [SharedPreferences],
  );

  GetIt.I.registerSingletonWithDependencies<ApiService>(
    () => ApiClient(
      currentRevision: GetIt.I.get<AppRevision>(),
    ).apiClient,
    dependsOn: [AppRevision],
  );

  GetIt.I.registerSingletonWithDependencies<TaskRemoteSource>(
    () => TaskApiRemoteSource(
      apiService: GetIt.I.get<ApiService>(),
      appRevision: GetIt.I.get<AppRevision>(),
    ),
    dependsOn: [AppRevision],
  );

  GetIt.I.registerSingletonWithDependencies<TaskLocalSource>(
    () => TaskDBLocalSource(
      dataBase: GetIt.I.get<TaskDataBase>(),
    ),
    dependsOn: [TaskDataBase],
  );

  GetIt.I.registerSingletonWithDependencies<TaskRepository>(
    () => TaskDataRepository(
      remoteSource: GetIt.I.get<TaskRemoteSource>(),
      localSource: GetIt.I.get<TaskLocalSource>(),
    ),
    dependsOn: [TaskLocalSource],
  );

  GetIt.I.registerSingletonWithDependencies<TaskUseCase>(
    () => TaskUseCase(
      repository: GetIt.I.get<TaskRepository>(),
    ),
    dependsOn: [TaskRepository],
  );
}
