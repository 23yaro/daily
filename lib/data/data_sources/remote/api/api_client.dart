import 'dart:io';

import 'package:daily/data/data_sources/remote/api/api_revision.dart';
import 'package:daily/data/data_sources/remote/api/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../../../utils/environment_variables/environment_variables.dart';

class ApiClient {
  ApiClient({required AppRevision currentRevision})
      : _currentRevision = currentRevision {
    _dio = Dio(
      BaseOptions(
        baseUrl: EnvironmentVariables.baseUrl,
        responseType: ResponseType.json,
        headers: {
          'Authorization': 'Bearer ${EnvironmentVariables.token}',
        },
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers["X-Last-Known-Revision"] = _currentRevision.revision;
          return handler.next(options);
        },
      ),
    );

    (_dio.httpClientAdapter as IOHttpClientAdapter)
        .createHttpClient = () => HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        return host == EnvironmentVariables.host;
      };

    apiClient = ApiService(_dio);
  }

  final AppRevision _currentRevision;

  late final Dio _dio;

  late final ApiService apiClient;
}
