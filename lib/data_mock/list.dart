import 'dart:math';

class Item {
  Item({
    required this.id,
    required this.name,
    required this.priority,
    required this.isComplete,
    required this.date,
  });

  int id;
  String name;
  int priority;
  bool isComplete;
  String? date;
}

int stub = items.fold(
    0,
    (previousValue, element) =>
        element.isComplete ? previousValue += 1 : previousValue);

final List<Item> items = List.generate(
    20,
    (index) => Item(
          id: index,
          name: names[Random().nextInt(names.length - 1)],
          priority: Random().nextInt(3),
          isComplete: Random().nextInt(2) == 0,
          date: Random().nextInt(3) == 0
              ? '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}'
              : null,
        ));

final List<String> names = [
  'Сходить в универ',
  'Полистать ленту',
  'Посмотреть видео на ютюбе',
  'Пойти куда-то, зачем-то почему-то старый бог старый бог старый бог старый бог старый бог старый бог старый бог ',
  'Взять себя в руки',
  'Посмотреть фильм',
  'Вынести мусор',
];
