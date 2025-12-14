import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:hungry_app/features/auth/views/login_view.dart';
import 'package:hungry_app/features/auth/views/widgets/profile_btn.dart';
import 'package:hungry_app/features/auth/views/widgets/profile_text_field.dart';
import 'package:hungry_app/features/checkout/views/widgets/payment_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with AutomaticKeepAliveClientMixin {
  late TextEditingController _nameCont;
  late TextEditingController _emailCont;
  late TextEditingController _addCont;
  String visa = "xxxx xxxx xxxx xxxx";

  @override
  void initState() {
    initControllers();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthCubit>().setProfileData();
    });
    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  initControllers() {
    _nameCont = TextEditingController();
    _emailCont = TextEditingController();
    _addCont = TextEditingController();
  }

  disposeControllers() {
    _nameCont.dispose();
    _addCont.dispose();
    _emailCont.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final cubit = context.watch<AuthCubit>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Image.asset("assets/icon/Group.png", width: 20),
            ),
          ],
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoadProfileData) {
              _nameCont.text = state.name;
              _emailCont.text = state.email;
              _addCont.text = state.address!;
              cubit.selectedImage = state.image;
              visa = state.visa.toString();
            }
          },
          builder: (context, state) {
            return Skeletonizer(
              enabled: state is AuthLoading,
              enableSwitchAnimation: true,
              effect: ShimmerEffect(
                baseColor: Colors.grey.shade600,
                highlightColor: Colors.grey.shade100,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Gap(30),
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: cubit.selectedImage == null
                              ? null
                              : DecorationImage(
                                  image: cubit.isGalleryImage
                                      ? FileImage(File(cubit.selectedImage!))
                                      : NetworkImage(cubit.selectedImage!),
                                ),
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                      ),
                      Gap(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: ProfileBtn(
                          text: "Change Image",
                          isFilled: true,
                          onTap: context.read<AuthCubit>().pickImage,
                        ),
                      ),
                      Gap(40),
                      ProfileTextField(
                        controller: _nameCont,
                        labelText: "Name",
                      ),
                      Gap(10),
                      ProfileTextField(
                        controller: _emailCont,
                        labelText: "Email",
                      ),
                      Gap(10),
                      ProfileTextField(
                        controller: _addCont,
                        labelText: "Address",
                      ),
                      Gap(40),
                      Divider(color: Colors.white),
                      Gap(40),
                      PaymentItem(
                        selectedValue: "cart",
                        onChanged: (c) {},
                        tileColor: Colors.black,
                        subTitle: visa,
                        title: "Debit card",
                        value: "card",
                        imagePath: "assets/icon/visa.png",
                      ),
                      Gap(40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProfileBtn(
                            text: "Edit Profile",
                            iconPath: "assets/svg/edit.svg",
                            isFilled: true,
                            onTap: () {
                              cubit.updateProfile(
                                email: _emailCont.text,
                                name: _nameCont.text,
                                address: _addCont.text,
                                visa: "xxxx xxxx xxxx 5894",
                              );
                            },
                          ),
                          ProfileBtn(
                            text: "Log out",
                            onTap: () {
                              context.read<AuthCubit>().clearUser();
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginView(),
                                ),
                                (route) => false,
                              );
                            },
                            iconPath: "assets/svg/sign-out.svg",
                            isFilled: false,
                          ),
                        ],
                      ),
                      Gap(110),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
