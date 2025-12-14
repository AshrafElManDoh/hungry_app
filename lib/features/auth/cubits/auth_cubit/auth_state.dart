part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  final UserModel user;

  AuthSuccess({required this.user});
}

final class AuthLoading extends AuthState {}

final class AuthSelectGalleryImage extends AuthState {}

final class AuthLoadProfileData extends AuthState {
  final String name, email;
  final String? address, visa, image;

  AuthLoadProfileData({
    required this.name,
    this.image,
    required this.email,
    this.address,
    this.visa,
  });
}

final class AuthFailed extends AuthState {
  final String msg;

  AuthFailed({required this.msg});
}

final class AuthLogOut extends AuthState {}
