import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../responses/api_response.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/list')
  Future<TasksListResponse> getAll();

  @PATCH('/list')
  Future<TasksListResponse> updateAll(@Body() Map<String, dynamic> body);

  @POST('/list')
  Future<TaskResponse> createTask(@Body() Map<String, dynamic> body);

  @GET('/list/{id}')
  Future<TaskResponse> getById(@Path('id') String id);

  @PUT('/list/{id}')
  Future<TaskResponse> updateTask(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/list/{id}')
  Future<TaskResponse> deleteTask(@Path('id') String id);
}
