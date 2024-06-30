// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TasksListResponse _$TasksListResponseFromJson(Map<String, dynamic> json) =>
    TasksListResponse(
      json['status'] as String,
      (json['revision'] as num).toInt(),
      (json['list'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$TasksListResponseToJson(TasksListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'revision': instance.revision,
      'list': instance.list,
    };

TaskResponse _$TaskResponseFromJson(Map<String, dynamic> json) => TaskResponse(
      json['status'] as String,
      (json['revision'] as num).toInt(),
      json['element'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$TaskResponseToJson(TaskResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'revision': instance.revision,
      'element': instance.element,
    };
