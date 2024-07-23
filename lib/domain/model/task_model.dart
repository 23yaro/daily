import 'package:uuid/uuid.dart';

class Task {
  Task({
    String? id,
    required this.text,
    this.importance = Importance.none,
    this.done = false,
    this.deadline,
    DateTime? createdAt,
    DateTime? changedAt,
  })  : id = id ?? const Uuid().v1(),
        createdAt = createdAt ?? DateTime.now(),
        changedAt = changedAt ?? DateTime.now();

  final String id;
  String text;
  Importance importance;
  bool done;
  DateTime? deadline;
  DateTime createdAt;
  DateTime changedAt;

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
      other.deadline == deadline &&
      other.createdAt == createdAt &&
      other.changedAt == changedAt;

  @override
  int get hashCode => id.hashCode;

  Task copyWith({
    String? id,
    String? text,
    Importance? importance,
    bool? done,
    DateTime? deadline,
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
