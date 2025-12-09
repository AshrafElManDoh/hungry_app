import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/utils/app_pref_helpers.dart';
import 'package:hungry_app/features/auth/data/models/user_model.dart';
import 'package:hungry_app/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepo) : super(LoginInitial());

  final AuthRepo _authRepo;

  login({required String email, required String password}) async {
    emit(LoginLoading());
    var resonse = await _authRepo.login(email: email, password: password);
    resonse.fold(
      (apiError) {
        emit(LoginFailed(msg: apiError.message));
      },
      (userModel) {
        saveUser(userModel);
        emit(LoginSuccess());
      },
    );
  }

  void saveUser(UserModel userModel) async {
    await AppPrefHelpers.saveData(AppPrefHelpers.tokenKey,userModel.token);
    await AppPrefHelpers.saveData(AppPrefHelpers.usernameKey,userModel.name);
    await AppPrefHelpers.saveData(AppPrefHelpers.emailKey,userModel.email);
  }
}
