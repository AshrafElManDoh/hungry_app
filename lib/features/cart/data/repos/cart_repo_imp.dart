import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api_errors.dart';
import 'package:hungry_app/core/network/api_exceptions.dart';
import 'package:hungry_app/core/network/api_services.dart';
import 'package:hungry_app/features/cart/data/models/cart_request_model.dart';
import 'package:hungry_app/features/cart/data/repos/cart_repo.dart';

class CartRepoImp implements CartRepo {
  final ApiServices apiServices;

  CartRepoImp({required this.apiServices});

  @override
  Future<Either<ApiErrors, String>> addToCart(
    CartRequestModel requestModel,
  ) async {
    try {
      log(requestModel.toJson().toString());
      var response = await apiServices.post(
        endPoints: "/cart/add",
        data: requestModel.toJson(),
      );
      return right(response["message"]);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ApiExceptions.handleError(e));
      } else {
        return left(ApiErrors(message: e.toString()));
      }
    }
  }
}
