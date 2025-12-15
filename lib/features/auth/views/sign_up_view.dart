import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/utils/app_styles.dart';
import 'package:hungry_app/core/widgets/custom_indicator.dart';
import 'package:hungry_app/core/widgets/underlined_text.dart';
import 'package:hungry_app/features/auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:hungry_app/features/auth/views/widgets/custom_btn.dart';
import 'package:hungry_app/features/auth/views/widgets/custom_text_field.dart';
import 'package:hungry_app/features/auth/views/widgets/custom_pass_field.dart';
import 'package:hungry_app/root.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late TextEditingController emailController;
  late TextEditingController passController;
  late TextEditingController nameController;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (c) => Root()),
                (route) => false,
              );
            }
            if (state is AuthFailed) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.msg)));
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is AuthLoading,
              progressIndicator: CustomIndicator(),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Gap(120),
                        SvgPicture.asset("assets/logo/hungry.svg"),
                        Gap(50),
                        CustomTextField(
                          hint: "Name",
                          controller: nameController,
                        ),
                        Gap(10),
                        CustomTextField(
                          hint: "Email",
                          controller: emailController,
                        ),
                        Gap(10),
                        CustomPassField(
                          hint: "Password",
                          controller: passController,
                        ),
                        Gap(50),
                        CustomBtn(
                          title: "Sign up",
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthCubit>().signup(
                                email: emailController.text.trim(),
                                password: passController.text.trim(),
                                name: nameController.text.trim(),
                              );
                            }
                          },
                        ),
                        Gap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Have you an account?",
                              style: AppStyles.style18().copyWith(
                                color: Colors.grey,
                              ),
                            ),
                            Gap(10),
                            UnderlinedText(
                              title: "Login",
                              onTap: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ],
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
}
