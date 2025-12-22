import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hungry_app/features/orderHistory/data/models/order_history_model.dart';
import 'package:hungry_app/features/orderHistory/data/repos/order_repo.dart';

part 'order_history_state.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  OrderHistoryCubit(this.orderRepo) : super(OrderHistoryInitial());

  final OrderRepo orderRepo;

  Future<void> getOrders() async {
    var response = await orderRepo.getOrders();
    response.fold(
      (err) => emit(OrderHistoryFailure(errMsg: err.message)),
      (items) => emit(OrderHistorySuccess(items: items)),
    );
  }
}
