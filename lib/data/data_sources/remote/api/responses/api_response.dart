import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

class ApiResponse {
  ApiResponse(this.status, this.revision);

  final String status;
  final int revision;
}

@JsonSerializable()
class TasksListResponse extends ApiResponse {
  TasksListResponse(super.status, super.revision, this.list);

  List<Map<String, dynamic>> list;

  factory TasksListResponse.fromJson(Map<String, dynamic> json) =>
      _$TasksListResponseFromJson(json);
}

@JsonSerializable()
class TaskResponse extends ApiResponse {
  TaskResponse(super.status, super.revision, this.element);

  final Map<String, dynamic> element;

  factory TaskResponse.fromJson(Map<String, dynamic> json) =>
      _$TaskResponseFromJson(json);
}
