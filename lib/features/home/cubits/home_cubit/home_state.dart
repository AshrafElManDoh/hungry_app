part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final String name;

  HomeLoaded({required this.name});
}

final class HomeSuccess extends HomeState {
  final List<ProductModel> products;

  HomeSuccess({required this.products});
}

final class HomeFailure extends HomeState {
  final String errMsg;

  HomeFailure({required this.errMsg});
}
