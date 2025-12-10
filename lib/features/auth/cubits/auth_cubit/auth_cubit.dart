import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/utils/app_pref_helpers.dart';
import 'package:hungry_app/features/auth/data/models/user_model.dart';
import 'package:hungry_app/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());

  final AuthRepo _authRepo;

  login({required String email, required String password}) async {
    emit(AuthLoading());
    var resonse = await _authRepo.login(email: email, password: password);
    resonse.fold(
      (apiError) {
        emit(AuthFailed(msg: apiError.message));
      },
      (userModel) {
        saveUser(userModel);
        emit(AuthSuccess(user: userModel));
      },
    );
  }

  signup({
    required String email,
    required String password,
    required String name,
  }) async {
    var resonse = await _authRepo.singup(
      email: email,
      password: password,
      name: name,
    );
    resonse.fold(
      (apiError) {
        emit(AuthFailed(msg: apiError.message));
      },
      (userModel) {
        saveUser(userModel);
        emit(AuthSuccess(user: userModel));
      },
    );
  }

  setProfileData() {
    emit(AuthLoading());
    final email =
        AppPrefHelpers.loadData(AppPrefHelpers.emailKey) as String? ?? "developer";
    final name =
        AppPrefHelpers.loadData(AppPrefHelpers.usernameKey) as String? ?? "test";

    log(email);
    log(name);
    emit(AuthLoadProfileData(name: name, email: email));
  }

  void saveUser(UserModel userModel) async {
    await AppPrefHelpers.saveData(AppPrefHelpers.tokenKey, userModel.token);
    await AppPrefHelpers.saveData(AppPrefHelpers.usernameKey, userModel.name);
    await AppPrefHelpers.saveData(AppPrefHelpers.emailKey, userModel.email);
  }
}
