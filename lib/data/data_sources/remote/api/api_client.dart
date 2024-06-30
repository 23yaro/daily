import 'dart:io';
import 'package:daily/utils/logger/logger.dart';
import 'package:dio/io.dart';
import 'package:daily/data/data_sources/remote/api/api_revision.dart';
import 'package:daily/data/data_sources/remote/api/service/api_service.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static const String baseUrl = "https://beta.mrdekk.ru/todo";

  static final instance = ApiClient._();

  final CurrentRevision revisionHolder = CurrentRevision();

  late final Dio _dio;

  late final ApiService apiService;

  ApiClient._() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        responseType: ResponseType.json,
      ),
    );

    _dio.interceptors
      ..add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            String token = getToken(); //dart-define
            logger.w('your token: $token');
            options.headers["Authorization"] = "Bearer $token";
            return handler.next(options);
          },
        ),
      )
      ..add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            revisionHolder.revision;
            options.headers["X-Last-Known-Revision"] = revisionHolder.revision;
            return handler.next(options);
          },
        ),
      );

    (_dio.httpClientAdapter as IOHttpClientAdapter)
        .createHttpClient = () => HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        return host == "beta.mrdekk.ru";
      };

    apiService = ApiService(_dio);
  }
}

String getToken() {
  return const String.fromEnvironment('TOKEN');
}
