import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api_errors.dart';

class ApiExceptions {
  
  static ApiErrors handleError(DioException error){
    switch (error.type){
      case DioExceptionType.connectionTimeout :
      return ApiErrors(message: "Bad connection!",);
      case DioExceptionType.badResponse :
      return ApiErrors(message: "Bad Response");
      default :
      return ApiErrors(message: "Something went wrong!");
    } 
  }
}