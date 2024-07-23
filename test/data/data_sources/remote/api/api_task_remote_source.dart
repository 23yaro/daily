import 'package:daily/data/data_sources/remote/api/api_revision.dart';
import 'package:daily/data/data_sources/remote/api/api_task_remote_source.dart';
import 'package:daily/data/data_sources/remote/api/responses/api_response.dart';
import 'package:daily/data/data_sources/remote/api/service/api_service.dart';
import 'package:daily/data/data_sources/remote/task_remote_source.dart';
import 'package:daily/data/dto/task_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dto/task_dto.dart';

class ApiClientMock extends Mock implements ApiService {}

class AppRevisionMock extends Mock implements AppRevision {}

void main() {
  late ApiService apiServiceMock;
  late AppRevision appRevisionMock;
  late TaskRemoteSource remoteSource;

  setUp(() {
    registerFallbackValue(FakeTaskDTO());

    apiServiceMock = ApiClientMock();
    appRevisionMock = AppRevisionMock();

    when(() =>
            apiServiceMock.createTask(any(that: isA<Map<String, dynamic>>())))
        .thenAnswer((_) => Future.value(FakeElementResponse()));
    when(() => appRevisionMock.set(any(that: isA<int>())))
        .thenAnswer((_) => Future.value());

    remoteSource = TaskApiRemoteSource(
      apiService: apiServiceMock,
      appRevision: appRevisionMock,
    );
  });

  group('TaskRemoteSource', () {
    test(
      'и его метод addTask должен обращаться к ApiService, '
      'сохранять ревизию и возвращать добавленную задачу',
      () async {
        // act
        var result = await remoteSource.addTask(FakeTaskDTO());

        // assert
        verify(() => apiServiceMock
            .createTask(any(that: isA<Map<String, dynamic>>()))).called(1);
        verify(() => appRevisionMock.set(any(that: isA<int>()))).called(1);

        expect(result, isA<TaskDTO>());
      },
    );
  });
}

class FakeResponse extends Fake implements TaskResponse {}

class FakeElementResponse extends Fake implements TaskResponse {
  @override
  int get revision => 0;

  @override
  Map<String, dynamic> get element => {
        "importance": "important",
        "deadline": 123,
        "id": "testId",
        "text": "testTask",
        "last_updated_by": "123",
        "created_at": 123,
        "changed_at": 123,
        "done": true
      };
}
