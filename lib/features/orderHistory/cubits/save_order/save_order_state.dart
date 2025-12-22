part of 'save_order_cubit.dart';

@immutable
sealed class SaveOrderState {}

final class SaveOrderInitial extends SaveOrderState {}

final class SaveOrderLoading extends SaveOrderState {}

final class SaveOrderSuccess extends SaveOrderState {
  final String msg;

  SaveOrderSuccess({required this.msg});
}

final class SaveOrderFailure extends SaveOrderState {
  final String errMsg;

  SaveOrderFailure({required this.errMsg});
}
