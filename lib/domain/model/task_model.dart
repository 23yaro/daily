import 'package:uuid/uuid.dart';

class Task {
  Task({
    String? id,
    required this.text,
    this.importance = Importance.none,
    this.done = false,
    this.deadline,
  }) : id = id ?? const Uuid().v1();

  final String id;
  String text;
  Importance importance;
  bool done;
  String? deadline;

  bool get hasDeadline => deadline != null;

  void complete() => done = !done;

  @override
  bool operator ==(Object other) =>
      other is Task &&
      other.runtimeType == runtimeType &&
      other.id == id &&
      other.text == text &&
      other.importance == importance &&
      other.done == done &&
      other.deadline == deadline;

  @override
  int get hashCode => id.hashCode;

  Task copyWith({
    String? id,
    String? text,
    Importance? importance,
    bool? done,
    String? deadline,
  }) {
    return Task(
        id: id ?? this.id,
        text: text ?? this.text,
        importance: importance ?? this.importance,
        done: done ?? this.done,
        deadline: deadline ?? this.deadline);
  }
}

enum Importance { none, low, high }
