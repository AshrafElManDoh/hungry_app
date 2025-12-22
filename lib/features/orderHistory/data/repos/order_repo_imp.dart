import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api_errors.dart';
import 'package:hungry_app/core/network/api_exceptions.dart';
import 'package:hungry_app/core/network/api_services.dart';
import 'package:hungry_app/features/cart/data/models/cart_request_model.dart';
import 'package:hungry_app/features/orderHistory/data/models/order_history_model.dart';
import 'package:hungry_app/features/orderHistory/data/repos/order_repo.dart';

class OrderRepoImp implements OrderRepo {
  final ApiServices apiServices;

  OrderRepoImp({required this.apiServices});

  @override
  Future<Either<ApiErrors, String>> saveOrder(CartRequestModel cart) async {
    try {
      var response = await apiServices.post(
        endPoints: "/orders",
        data: cart.toJson(),
      );
      return right(response["message"]);
    } catch (e) {
      if (e is DioException) {
        return left(ApiExceptions.handleError(e));
      } else {
        return left(ApiErrors(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<ApiErrors, List<OrderHistoryModel>>> getOrders() async {
    try {
      var response = await apiServices.get(endPoints: "/orders");
      return right(
        (response["data"] as List)
            .map((e) => OrderHistoryModel.fromJson(e))
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
