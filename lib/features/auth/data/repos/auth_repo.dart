import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/network/api_errors.dart';
import 'package:hungry_app/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<ApiErrors, UserModel>> login({
    required String email,
    required String password,
  });
  Future<Either<ApiErrors, UserModel>> singup({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<ApiErrors, UserModel>> getProfileData();
  Future<Either<ApiErrors, UserModel>> updateProfile({
    required String email,
    required String name,
    String? address,
    String? imagePath,
    String? visa,
  });

  Future<Either<ApiErrors , String>> logout() ;
}
