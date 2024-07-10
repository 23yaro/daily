import '../../domain/model/task_model.dart';
import '../dto/task_dto.dart';

extension TaskMapper on Task {
  TaskDTO toTaskDto() {
    return TaskDTO(
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
        lastUpdatedBy: "myDevice");
  }
}

extension TaskDTOMapper on TaskDTO {
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
          ? DateTime.fromMillisecondsSinceEpoch(
              Duration(seconds: deadline!).inMilliseconds)
          : null,
    );
  }

  Map<String, dynamic> toDbJson() {
    Map<String, dynamic> json = toJson();
    json["done"] = done ? 1 : 0;
    return json;
  }

  Map<String, dynamic> toApiJson() {
    return {"element": toJson()};
  }
}
