import 'package:daily/domain/task_usecase/task_usecase.dart';
import 'package:daily/features/home/provider_notifiers/task_list_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class TaskUseCaseMock extends Mock implements TaskUseCase {}

void main() {
  late TaskUseCase taskUseCase;
  late TaskListNotifier taskListNotifier;

  setUp(() {
    taskUseCase = TaskUseCaseMock();

    when(() => taskUseCase.callGetTaskList())
        .thenAnswer((_) => Future.value([]));
    when(() => taskUseCase.callUpdateTaskList([]))
        .thenAnswer((_) => Future.value(true));

    taskListNotifier = TaskListNotifier(taskUseCase: taskUseCase);
  });

  group('TaskListNotifier', () {
    test(
      'и его метод loadTask должен обращаться к TaskUseCase, '
      'Сохранять лист вызывая callGetTaskList, '
      'и после этого обновлять лист вызывать метод callUpdateTaskList',
      () async {
        // act
        await taskListNotifier.loadTasks();

        // assert
        verify(() => taskUseCase.callGetTaskList()).called(1);
        verify(() => taskUseCase.callUpdateTaskList([])).called(1);
      },
    );
  });
}
