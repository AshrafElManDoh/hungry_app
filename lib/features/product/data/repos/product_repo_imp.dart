import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api_errors.dart';
import 'package:hungry_app/core/network/api_exceptions.dart';
import 'package:hungry_app/core/network/api_services.dart';
import 'package:hungry_app/features/product/data/models/topping_model.dart';
import 'package:hungry_app/features/product/data/repos/product_repo.dart';

class ProductRepoImp implements ProductRepo {
  final ApiServices apiServices;

  ProductRepoImp({required this.apiServices});
  @override
  Future<Either<ApiErrors, List<ToppingModel>>> getToppings() async {
    try {
      var response = await apiServices.get(endPoints: "/toppings");
      return right(
        (response["data"] as List)
            .map((e) => ToppingModel.fromJson(e))
            .toList(),
      );
    } catch (e) {
      if (e is DioException) {
        return left(ApiExceptions.handleError(e));
      } else {
        return left(ApiErrors(message: e.toString()));
      }
    }
  }


  @override
  Future<Either<ApiErrors, List<ToppingModel>>> getSideOptions() async {
    try {
      var response = await apiServices.get(endPoints: "/side-options");
      return right(
        (response["data"] as List)
            .map((e) => ToppingModel.fromJson(e))
            .toList(),
      );
    } catch (e) {
      if (e is DioException) {
        return left(ApiExceptions.handleError(e));
      } else {
        return left(ApiErrors(message: e.toString()));
      }
    }
  }
}
