import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/widgets/custom_indicator.dart';
import 'package:hungry_app/features/auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:hungry_app/features/auth/views/add_card_view.dart';
import 'package:hungry_app/features/auth/views/login_view.dart';
import 'package:hungry_app/features/auth/views/widgets/profile_btn.dart';
import 'package:hungry_app/features/auth/views/widgets/profile_text_field.dart';
import 'package:hungry_app/features/checkout/views/widgets/payment_item.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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

  @override
  void initState() {
    initControllers();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthCubit>().getProfileData();
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
              cubit.visa = state.visa;
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is AuthLogoutLoading,
              opacity: 0,
              progressIndicator: CustomIndicator(),
              child: Skeletonizer(
                enabled: state is AuthLoading,
                enableSwitchAnimation: true,
                effect: ShimmerEffect(
                  baseColor: Colors.grey.shade600,
                  highlightColor: Colors.grey.shade100,
                ),
                child: RefreshIndicator(
                  color: AppColors.primaryColor,
                  onRefresh: () => cubit.getProfileData(),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Gap(30),
                          CustomCircleAvatarImage(cubit: cubit),
                          Gap(20),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
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

                          ///visa
                          cubit.visa == null || cubit.visa!.isEmpty
                              ? ProfileBtn(
                                  text: "Add visa",
                                  isFilled: true,
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const AddCardView(),
                                    ),
                                  ),
                                )
                              : PaymentItem(
                                  selectedValue: "cart",
                                  onChanged: (c) {},
                                  tileColor: Colors.black,
                                  subTitle: cubit.visa,
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
                                    visa: cubit.visa,
                                  );
                                },
                              ),
                              ProfileBtn(
                                text: "Log out",
                                onTap: () async {
                                  await context.read<AuthCubit>().clearUser();
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

class CustomCircleAvatarImage extends StatelessWidget {
  const CustomCircleAvatarImage({
    super.key,
    required this.cubit,
  });

  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 67,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 65,
        backgroundColor: Colors.grey,
        child: cubit.selectedImage == null
            ? Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              )
            : ClipOval(
                child: cubit.isGalleryImage
                    ? Image.file(
                        File(cubit.selectedImage!),
                        height: 130,
                        width: 130,
                        fit: BoxFit.contain,
                      )
                    : CachedNetworkImage(
                        imageUrl: cubit.selectedImage!,
                        height: 130,
                        width: 130,
                        fit: BoxFit.contain,
                        placeholder: (context, url) => Center(
                          child:
                              CupertinoActivityIndicator(),
                        ),
                        errorWidget:
                            (context, url, error) => Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                      ),
              ),
      ),
    );
  }
}
