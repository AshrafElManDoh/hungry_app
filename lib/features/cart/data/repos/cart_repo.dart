import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/network/api_errors.dart';
import 'package:hungry_app/features/cart/data/models/cart_request_model.dart';

abstract class CartRepo {
  Future<Either<ApiErrors,String>> addToCart(CartRequestModel requestModel);
}