import 'dart:math';

import 'package:daily/di/di_container.dart';
import 'package:daily/domain/model/task_model.dart';
import 'package:daily/features/home/widgets/list_item/home_list_item.dart';
import 'package:daily/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Создание нвого элемента Task в списке задач',
      (widgetTester) async {
    // arrange
    setupGetIt();
    await GetIt.I.allReady();

    await widgetTester.pumpWidget(const MyApp());
    String testTaskTitle = "test new task: ${Random().nextInt(100)}";

    // act
    final fab = find.byType(FloatingActionButton);
    await widgetTester.tap(fab);
    await widgetTester.pumpAndSettle();

    await widgetTester.enterText(find.byType(TextField), testTaskTitle);

    await widgetTester.tap(find.byType(DropdownButton<Importance>));
    await widgetTester.pumpAndSettle();
    await widgetTester.tap(find.byKey(const ObjectKey(Importance.low)));
    await widgetTester.pumpAndSettle();

    await widgetTester.tap(find.byType(Switch));
    await widgetTester.pumpAndSettle();
    await widgetTester.tap(find.text('15'));
    await widgetTester.tap(find.text('ОК'));
    await widgetTester.pumpAndSettle();

    await widgetTester.tap(find.byKey(const ValueKey('save_button')));
    await widgetTester.pumpAndSettle(const Duration(seconds: 10));

    // assert
    expect(
      find.byWidgetPredicate((widget) {
        return widget is HomeListItem && widget.task.text == testTaskTitle;
      }),
      findsOne,
    );
  });
}
