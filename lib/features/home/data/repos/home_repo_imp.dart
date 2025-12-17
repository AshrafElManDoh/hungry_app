import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api_errors.dart';
import 'package:hungry_app/core/network/api_exceptions.dart';
import 'package:hungry_app/core/network/api_services.dart';
import 'package:hungry_app/features/home/data/repos/home_repo.dart';

import '../models/product_model.dart';

class HomeRepoImp implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImp({required this.apiServices});
  @override
  Future<Either<ApiErrors, List<ProductModel>>> getProducts() async {
    try {
      var response = await apiServices.get(endPoints: "/products");
      return right(
        (response["data"] as List)
            .map((e) => ProductModel.fromJson(e))
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
