import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api_errors.dart';
import 'package:hungry_app/core/network/api_exceptions.dart';
import 'package:hungry_app/core/network/api_services.dart';
import 'package:hungry_app/features/auth/data/models/user_model.dart';
import 'package:hungry_app/features/auth/data/repos/auth_repo.dart';

class AuthRepoImp implements AuthRepo {
  final ApiServices apiServices;

  AuthRepoImp({required this.apiServices});

  @override
  Future<Either<ApiErrors, UserModel>> login({
    required String email,
    required String password,
  }) async {
    final data = {"email": email, "password": password};
    try {
      final resonse = await apiServices.post(endPoints: "/login", data: data);
      return right(UserModel.fromJson(resonse["data"]));
    } catch (e) {
      if (e is DioException) {
        return left(ApiExceptions.handleError(e));
      } else {
        return left(ApiErrors(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<ApiErrors, UserModel>> singup({
    required String email,
    required String password,
    required String name,
  }) async {
    final data = {"email": email, "name": name, "password": password};
    try {
      var resonse = await apiServices.post(endPoints: "/register", data: data);
      return right(UserModel.fromJson(resonse["data"]));
    } catch (e) {
      if (e is DioException) {
        return left(ApiExceptions.handleError(e));
      } else {
        return left(ApiErrors(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<ApiErrors, UserModel>> getProfileData() async {
    try {
      var resonse = await apiServices.get(endPoints: "/profile");
      return right(UserModel.fromJson(resonse["data"]));
    } catch (e) {
      if (e is DioException) {
        return left(ApiExceptions.handleError(e));
      } else {
        return left(ApiErrors(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<ApiErrors, UserModel>> updateProfile({
    required String email,
    required String name,
    String? address,
    String? imagePath,
    String? visa,
  }) async {
    final FormData data = FormData.fromMap({
      "name": name,
      "email": email,
      if (address != null) "address": address,
      if (visa != null && visa.isNotEmpty) "Visa": visa,
      if (imagePath != null && imagePath.isNotEmpty)
        "image": await MultipartFile.fromFile(
          imagePath,
          // filename: "profile.jpg",
        ),
    });
    try {
      var resonse = await apiServices.post(
        endPoints: "/update-profile",
        data: data,
      );
      return right(UserModel.fromJson(resonse["data"]));
    } catch (e) {
      if (e is DioException) {
        return left(ApiExceptions.handleError(e));
      } else {
        return left(ApiErrors(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<ApiErrors, String>> logout() async {
    try {
      var resonse = await apiServices.post(endPoints: "/logout", data: null);
      return right(resonse["message"]);
    } catch (e) {
      if (e is DioException) {
        return left(ApiExceptions.handleError(e));
      } else {
        return left(ApiErrors(message: e.toString()));
      }
    }
  }
}
