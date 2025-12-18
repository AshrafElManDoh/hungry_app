part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartAddItem extends CartState {
  final String msg ;

  CartAddItem({required this.msg});
}

final class CartGetItems extends CartState {}

final class CartFailure extends CartState {
  final String errMsg;

  CartFailure({required this.errMsg});
}
