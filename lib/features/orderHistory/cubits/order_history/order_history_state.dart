part of 'order_history_cubit.dart';

@immutable
sealed class OrderHistoryState {}

final class OrderHistoryInitial extends OrderHistoryState {}

final class OrderHistoryLoading extends OrderHistoryState {}

final class OrderHistoryFailure extends OrderHistoryState {
  final String errMsg;

  OrderHistoryFailure({required this.errMsg});
}

final class OrderHistorySuccess extends OrderHistoryState {
  final List<OrderHistoryModel> items;

  OrderHistorySuccess({required this.items});
}
