import 'package:json_annotation/json_annotation.dart';

part 'task_dto.g.dart';

@JsonSerializable()
class TaskDTO {
  TaskDTO({
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

  factory TaskDTO.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDtoToJson(this);

  factory TaskDTO.fromDbJson(Map<String, dynamic> dbJson) {
    Map<String, dynamic> json = Map.of(dbJson);

    if (json["done"] == 1) {
      json["done"] = true;
    } else {
      json["done"] = false;
    }

    return TaskDTO.fromJson(json);
  }
}
