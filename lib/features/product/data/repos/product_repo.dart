import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/network/api_errors.dart';
import 'package:hungry_app/features/product/data/models/topping_model.dart';

abstract class ProductRepo {
  Future<Either<ApiErrors,List<ToppingModel>>> getToppings();
  Future<Either<ApiErrors, List<ToppingModel>>> getSideOptions() ;
}