import 'package:uuid/uuid.dart';

import '../../data/dto/task_dto.dart';
import '../../utils/formatters/formatters.dart';

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

extension Mapper on Task {
  TaskDto toTaskDto() {
    return TaskDto(
        id: id,
        text: text,
        importance: switch (importance) {
          Importance.none => "basic",
          Importance.low => "low",
          Importance.high => "important",
        },
        deadline: hasDeadline
            ? Duration(milliseconds: deadline!.millisecondsSinceEpoch).inSeconds
            : null,
        done: done,
        createdAt: Duration(
          milliseconds: createdAt.millisecondsSinceEpoch,
        ).inSeconds,
        changedAt: Duration(
          milliseconds: changedAt.millisecondsSinceEpoch,
        ).inSeconds,
        lastUpdatedBy: "myDevice"
        );
  }
}
