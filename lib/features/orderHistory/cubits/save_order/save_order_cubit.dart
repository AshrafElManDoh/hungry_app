import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hungry_app/features/cart/data/models/cart_request_model.dart';
import 'package:hungry_app/features/orderHistory/data/repos/order_repo.dart';

part 'save_order_state.dart';

class SaveOrderCubit extends Cubit<SaveOrderState> {
  SaveOrderCubit(this.orderRepo) : super(SaveOrderInitial());

  final OrderRepo orderRepo;

  Future<void> saveOrder(CartRequestModel items) async {
    emit(SaveOrderLoading());
    var response = await orderRepo.saveOrder(items);
    response.fold(
      (errMsg) => emit(SaveOrderFailure(errMsg: errMsg.message)),
      (msg) => emit(SaveOrderSuccess(msg: msg)),
    );
  }
}
