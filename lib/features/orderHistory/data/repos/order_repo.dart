import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/network/api_errors.dart';
import 'package:hungry_app/features/cart/data/models/cart_request_model.dart';
import 'package:hungry_app/features/orderHistory/data/models/order_history_model.dart';

abstract class OrderRepo {
  Future<Either<ApiErrors, String>> saveOrder(CartRequestModel cart);
  Future<Either<ApiErrors, List<OrderHistoryModel>>> getOrders();
}
