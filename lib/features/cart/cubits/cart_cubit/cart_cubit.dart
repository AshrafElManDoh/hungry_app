import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hungry_app/features/cart/data/models/cart_data_model.dart';
import 'package:hungry_app/features/cart/data/models/cart_model.dart';
import 'package:hungry_app/features/cart/data/models/cart_request_model.dart';
import 'package:hungry_app/features/cart/data/repos/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());

  final CartRepo cartRepo;

  CartDataModel? cartDataModel;
  double totalPrice = 0;

  Future<void> addToCart(CartModel cartmodel) async {
    emit(CartAddLoading());
    var response = await cartRepo.addToCart(CartRequestModel([cartmodel]));
    response.fold((error) => emit(CartFailure(errMsg: error.message)), (
      successMsg,
    ) {
      emit(CartAddItem(msg: successMsg));
      getCartItems();
    });
  }

  void calculateTotal() {
    totalPrice = 0;
    for (final e in cartDataModel!.items) {
      totalPrice += double.parse(e.price) * e.quantity;
    }
  }

  Future<void> getCartItems() async {
    var response = await cartRepo.getCartData();
    response.fold((error) => emit(CartFailure(errMsg: error.message)), (
      cartData,
    ) {
      cartDataModel = cartData;
      if (cartDataModel?.items == null || cartDataModel!.items.isEmpty) {
        emit(CartFailure(errMsg: "Your cart is empty"));
      } else {
        calculateTotal();
        emit(CartGetItems(cartDataModel: cartData));
      }
    });
  }

  Future<void> removeFromCart(int itemId) async {
    emit(CartremoveLoading());
    var response = await cartRepo.removeFromCart(itemId);
    response.fold((error) => emit(CartFailure(errMsg: error.message)), (
      successMsg,
    ) {
      getCartItems();
    });
  }
}
