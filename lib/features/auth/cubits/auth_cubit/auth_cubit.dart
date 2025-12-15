import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/utils/app_pref_helpers.dart';
import 'package:hungry_app/features/auth/data/models/user_model.dart';
import 'package:hungry_app/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());

  final AuthRepo _authRepo;
  String? selectedImage;
  bool isGalleryImage = false;
  String? visa = '';

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
    emit(AuthLoading());
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

  getProfileData() async {
    emit(AuthLoading());
    var resonse = await _authRepo.getProfileData();
    resonse.fold(
      (apiError) {
        emit(AuthFailed(msg: apiError.message));
      },
      (userModel) {
        emit(
          AuthLoadProfileData(
            name: userModel.name,
            email: userModel.email,
            image: userModel.imageUrl!,
            address: userModel.address,
            visa: userModel.visa,
          ),
        );
      },
    );
  }

  updateProfile({
    required String email,
    required String name,
    String? address,
    String? visa,
  }) async {
    emit(AuthLoading());
    String? image =
        isGalleryImage && selectedImage != null && selectedImage!.isNotEmpty
        ? selectedImage
        : null;
    log(image ?? "It's null");
    var resonse = await _authRepo.updateProfile(
      email: email,
      name: name,
      address: address,
      visa: visa,
      imagePath: image,
    );
    resonse.fold(
      (apiError) {
        emit(AuthFailed(msg: apiError.message));
      },
      (userModel) {
        isGalleryImage = false;
        emit(
          AuthLoadProfileData(
            name: userModel.name,
            email: userModel.email,
            image: userModel.imageUrl,
            address: userModel.address,
            visa: userModel.visa,
          ),
        );
      },
    );
  }

  Future<void> pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage == null) return;

    selectedImage = pickedImage.path;
    isGalleryImage = true;
    emit(AuthSelectGalleryImage());
  }

  setCard(String cardNumber) {
    visa = cardNumber;
    emit(AuthAddedCard());
  }

  Future<void> clearUser() async {
    emit(AuthLogoutLoading());
    var resonse = await _authRepo.logout();
    resonse.fold(
      (apiError) {
        emit(AuthFailed(msg: apiError.message));
      },
      (message) async {
        await AppPrefHelpers.clearData();
        emit(AuthLogOut());
      },
    );
  }

  void saveUser(UserModel userModel) async {
    await AppPrefHelpers.saveData(AppPrefHelpers.tokenKey, userModel.token);
    await AppPrefHelpers.saveData(AppPrefHelpers.usernameKey, userModel.name);
    await AppPrefHelpers.saveData(AppPrefHelpers.emailKey, userModel.email);
  }
}
