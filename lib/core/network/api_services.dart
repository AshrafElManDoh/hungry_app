import 'package:hungry_app/core/network/dio_clients.dart';

class ApiServices {
  final _dio = DioClients().dio;

  Future<dynamic> post({
    required String endPoints,
    required Map<String, dynamic> data,
  }) async {
    var response = await _dio.post(endPoints, data: data);
    return response.data;
  }

  Future<dynamic> put({
    required String endPoints,
    required Map<String, dynamic> data,
  }) async {
    var response = await _dio.put(endPoints, data: data);
    return response.data;
  }

  Future<dynamic> delete({
    required String endPoints,
    required Map<String, dynamic> data,
  }) async {
    var response = await _dio.delete(endPoints, data: data);
    return response.data;
  }

  Future<dynamic> get({
    required String endPoints,
    required Map<String, dynamic>? data,
  }) async {
    var response = await _dio.get(endPoints, data: data);
    return response.data;
  }
}
