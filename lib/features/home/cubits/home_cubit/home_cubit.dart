import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/utils/app_pref_helpers.dart';
import 'package:hungry_app/features/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo;

  late String name;
  List<ProductModel> allproducts = [];

  void loadData() {
    name =
        AppPrefHelpers.loadData(AppPrefHelpers.usernameKey) as String? ??
        "Our guest";

    emit(HomeLoaded(name: name));
  }

  Future<void> getProducts() async {
    var response = await homeRepo.getProducts();
    response.fold(
      (errMsg) {
        emit(HomeFailure(errMsg: errMsg.message));
      },
      (products) {
        allproducts = products;
        emit(HomeSuccess(products: allproducts));
      },
    );
  }
   
  void searchProducts(String query) {
    final filteredProducts = allproducts
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(HomeSuccess(products: filteredProducts));
  }

}
