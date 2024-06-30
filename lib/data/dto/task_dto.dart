import 'package:daily/domain/model/task_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/formatters/formatters.dart';

part 'task_dto.g.dart';

@JsonSerializable()
class TaskDto {
  TaskDto({
    required this.id,
    required this.text,
    required this.importance,
    this.deadline,
    required this.done,
    this.color,
    required this.createdAt,
    required this.changedAt,
    required this.lastUpdatedBy,
  });

  final String id;
  final String text;
  final String importance;
  final int? deadline;
  final bool done;
  final String? color;
  @JsonKey(name: "created_at")
  final int createdAt;
  @JsonKey(name: "changed_at")
  final int changedAt;
  @JsonKey(name: "last_updated_by")
  final String lastUpdatedBy;

  factory TaskDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDtoToJson(this);

  factory TaskDto.fromDbJson(Map<String, dynamic> dbJson) {
    Map<String, dynamic> json = Map.of(dbJson);

    if (json["done"] == 1) {
      json["done"] = true;
    } else {
      json["done"] = false;
    }

    return TaskDto.fromJson(json);
  }
}

extension TaskDtoMapper on TaskDto {
  Task toTask() {
    return Task(
      id: id,
      text: text,
      done: done,
      importance: switch (importance) {
        'important' => Importance.high,
        'low' => Importance.low,
        _ => Importance.none,
      },
      deadline: deadline != null
          ? DateTime.fromMicrosecondsSinceEpoch(
              Duration(seconds: deadline!).inMilliseconds)
          : null,
    );
  }

  Map<String, dynamic> toDbJson() {
    Map<String, dynamic> json = toJson();
    json["done"] = done ? 1 : 0;
    return json;
  }
}
