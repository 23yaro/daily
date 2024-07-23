import 'package:daily/data/data_repository/task_data_repository.dart';
import 'package:daily/data/data_sources/local/db_sqflite/db_task_local_source.dart';
import 'package:daily/data/data_sources/local/task_local_source.dart';
import 'package:daily/data/data_sources/remote/api/api_task_remote_source.dart';
import 'package:daily/data/data_sources/remote/task_remote_source.dart';
import 'package:daily/data/dto/task_dto.dart';
import 'package:daily/domain/model/task_model.dart';
import 'package:daily/domain/repository/task_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../dto/task_dto.dart';

class TaskApiRemoteSourceMock extends Mock implements TaskApiRemoteSource {}

class TaskDBLocalSourceMock extends Mock implements TaskDBLocalSource {}

void main() {
  late TaskRemoteSource remoteSourceMock;
  late TaskLocalSource localSourceMock;
  late TaskRepository repository;

  Task task = Task(
    id: 'taskId',
    text: 'test',
    importance: Importance.low,
    done: false,
    createdAt: DateTime(2024, 7, 10),
    changedAt: DateTime(2024, 7, 10),
  );

  setUp(() {
    registerFallbackValue(FakeTaskDTO());

    remoteSourceMock = TaskApiRemoteSourceMock();
    localSourceMock = TaskDBLocalSourceMock();

    // mock task creation
    when(() => remoteSourceMock.addTask(any(that: isA<TaskDTO>())))
        .thenAnswer((_) => Future.value(FakeTaskDTO()));
    when(() => localSourceMock.addTask(any(that: isA<TaskDTO>())))
        .thenAnswer((_) => Future.value());

    // mock receiving task list
    when(() => remoteSourceMock.getTaskList())
        .thenAnswer((_) => Future.value([]));
    when(() => localSourceMock.saveTaskList(any(that: isA<List<TaskDTO>>())))
        .thenAnswer((_) => Future.value());
    when(() => localSourceMock.getTaskList())
        .thenAnswer((_) => Future.value([]));

    repository = TaskDataRepository(
      remoteSource: remoteSourceMock,
      localSource: localSourceMock,
    );
  });

  group('TaskRepository', () {
    test(
        'и его метод addTask при наличии интернета должен отправлять задачу'
        'на сервер и сохранять возвращенную задачу в базу данных', () async {
      // act
      bool result = await repository.addTask(task);

      // assert
      verify(() => remoteSourceMock.addTask(any(that: isA<TaskDTO>())))
          .called(1);
      verify(() => localSourceMock.addTask(any(that: isA<TaskDTO>())))
          .called(1);

      expect(result, isTrue);
    });

    test(
        'и его метод addTask при отсутсвии интернета или выбросе исключения '
        'должен сохранять задачу в базу данных', () async {
      // act
      bool result = await repository.addTask(task);

      // assert
      verify(() => localSourceMock.addTask(any(that: isA<TaskDTO>())))
          .called(1);

      expect(result, isTrue);
    });

    test(
        'и его метод getTaskList при наличии интернета '
        'берет список задач с сервера, и сохраняет в бд'
        'после чего возвращает список с БД', () async {
      // act
      await repository.getTaskList();

      // assert
      verify(() => remoteSourceMock.getTaskList()).called(1);
      verify(() =>
              localSourceMock.saveTaskList(any(that: isA<List<TaskDTO>>())))
          .called(1);
      verify(() => localSourceMock.getTaskList()).called(1);
    });
  });
}
