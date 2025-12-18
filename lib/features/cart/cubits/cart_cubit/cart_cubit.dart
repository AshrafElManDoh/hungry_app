import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hungry_app/features/cart/data/models/cart_model.dart';
import 'package:hungry_app/features/cart/data/models/cart_request_model.dart';
import 'package:hungry_app/features/cart/data/repos/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());

  final CartRepo cartRepo;


  Future<void> addToCart(CartModel cartmodel) async {
    emit(CartLoading());
    var response = await cartRepo.addToCart(CartRequestModel([cartmodel]));
    response.fold(
      (error) => emit(CartFailure(errMsg: error.message)),
      (successMsg) => emit(CartAddItem(msg: successMsg)),
    );
  }
}
