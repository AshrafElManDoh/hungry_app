part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSelectionChanged extends ProductState {}

final class ProductSuccess extends ProductState {
  final List<ToppingModel> toppings;
  final List<ToppingModel> sideOptions;

  ProductSuccess({required this.toppings, required this.sideOptions});
}

final class ProductFailure extends ProductState {
  final String errMsg;

  ProductFailure({required this.errMsg});
}
