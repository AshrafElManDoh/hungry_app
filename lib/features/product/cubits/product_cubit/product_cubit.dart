import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hungry_app/features/product/data/models/topping_model.dart';
import 'package:hungry_app/features/product/data/repos/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProductInitial());

  final ProductRepo productRepo;

  ProductSuccess? lastSuccessState;

  final Set<int> selectedToppings = {};
  final Set<int> selectedSideOptions = {};

  double spicyLevel = 0;

  int itemQty = 1;

  void onChangeCounter(int newValue) {
    if (newValue >= 1) {
      itemQty = newValue;
      emit(ProductSelectionChanged());
    }
  }

  void onChangeSpicy(double newValue) {
    spicyLevel = newValue;
    emit(ProductSelectionChanged());
  }

  double calcTotal(String price) {
    return double.parse(price) * itemQty;
  }

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
              lastSuccessState = ProductSuccess(
                toppings: toppings,
                sideOptions: sideOptions,
              ),
            );
          },
        );
      },
    );
  }

  void toggleTopping(int id) {
    selectedToppings.contains(id)
        ? selectedToppings.remove(id)
        : selectedToppings.add(id);

    emit(ProductSelectionChanged());
  }

  void toggleSideOption(int id) {
    selectedSideOptions.contains(id)
        ? selectedSideOptions.remove(id)
        : selectedSideOptions.add(id);

    emit(ProductSelectionChanged());
  }
}
