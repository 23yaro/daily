// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskDTO _$TaskDtoFromJson(Map<String, dynamic> json) => TaskDTO(
      id: json['id'] as String,
      text: json['text'] as String,
      importance: json['importance'] as String,
      deadline: (json['deadline'] as num?)?.toInt(),
      done: json['done'] as bool,
      color: json['color'] as String?,
      createdAt: (json['created_at'] as num).toInt(),
      changedAt: (json['changed_at'] as num).toInt(),
      lastUpdatedBy: json['last_updated_by'] as String,
    );

Map<String, dynamic> _$TaskDtoToJson(TaskDTO instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'importance': instance.importance,
      'deadline': instance.deadline,
      'done': instance.done,
      'color': instance.color,
      'created_at': instance.createdAt,
      'changed_at': instance.changedAt,
      'last_updated_by': instance.lastUpdatedBy,
    };
