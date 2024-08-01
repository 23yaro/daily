import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_dto.freezed.dart';
part 'task_dto.g.dart';

@freezed
class TaskDTO extends Equatable with _$TaskDTO {
  const TaskDTO._();

  const factory TaskDTO({
    required String id,
    required String text,
    required String importance,
    int? deadline,
    required bool done,
    String? color,
    @JsonKey(name: "created_at") required int createdAt,
    @JsonKey(name: "changed_at") required int changedAt,
    @JsonKey(name: "last_updated_by") required String lastUpdatedBy,
  }) = _TaskDTO;

  factory TaskDTO.fromJson(Map<String, dynamic> json) =>
      _$TaskDTOFromJson(json);

  factory TaskDTO.fromDbJson(Map<String, dynamic> dbJson) {
    Map<String, dynamic> json = Map.of(dbJson);

    if (json["done"] == 1) {
      json["done"] = true;
    } else {
      json["done"] = false;
    }

    return TaskDTO.fromJson(json);
  }

  @override
  List<Object?> get props => [
        id,
        text,
        importance,
        deadline,
        done,
        color,
        createdAt,
        changedAt,
        lastUpdatedBy,
      ];
}
