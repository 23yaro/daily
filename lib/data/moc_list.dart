import 'dart:math';

import '../domain/model/task_model.dart';
import '../utils/formatters/date_formatter.dart';

class Moc {
  List<Task> items = List.generate(
    20,
    (index) => Task(
      text: names[Random().nextInt(names.length - 1)],
      done: Random().nextInt(2) == 0,
      deadline: Random().nextInt(3) == 0
          ? convertDateTimeToString(DateTime.now())
          : null,
    ),
  );

  static List<String> names = [
    'Сходить в универ',
    'Полистать ленту',
    'Посмотреть видео на ютюбе',
    'Пойти куда-то, зачем-то почему-то старый бог старый бог старый бог старый бог старый бог старый бог старый бог ',
    'Взять себя в руки',
    'Посмотреть фильм',
    'Вынести мусор',
  ];
}
