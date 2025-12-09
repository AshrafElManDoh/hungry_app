import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/network/api_errors.dart';
import 'package:hungry_app/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<ApiErrors, UserModel>> login({
    required String email,
    required String password,
  });
}
