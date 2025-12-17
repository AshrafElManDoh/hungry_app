import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hungry_app/features/product/data/models/topping_model.dart';
import 'package:hungry_app/features/product/data/repos/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProductInitial());

  final ProductRepo productRepo;

  Future<void> loadProductOptions() async {
    emit(ProductLoading());

    final toppingsResult = await productRepo.getToppings();
    final sideOptionsResult = await productRepo.getSideOptions();

    toppingsResult.fold(
      (failure) {
        emit(ProductFailure(errMsg: failure.message));
      },
      (toppings) {
        sideOptionsResult.fold(
          (failure) {
            emit(ProductFailure(errMsg: failure.message));
          },
          (sideOptions) {
            emit(
              ProductSuccess(
                toppings: toppings,
                sideOptions: sideOptions,
              ),
            );
          },
        );
      },
    );
  }
}
