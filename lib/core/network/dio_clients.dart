import 'package:dio/dio.dart';
import 'package:hungry_app/core/utils/app_pref_helpers.dart';

class DioClients {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://sonic-zdi0.onrender.com/api",
      headers: {"Content-Type": "application/json"},
    ),
  );

  DioClients() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = AppPrefHelpers.loadData(AppPrefHelpers.tokenKey);
          if (token != null && token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }
          return handler.next(options);
        },
      ),
    );
  }

  Dio get dio => _dio;
}
