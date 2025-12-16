import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/network/api_errors.dart';
import '../models/product_model.dart';

abstract class HomeRepo {
  Future<Either<ApiErrors, List<ProductModel>>> getProducts();
}
