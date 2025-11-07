import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/views/widgets/custom_btn.dart';
import 'package:hungry_app/features/auth/views/widgets/custom_email_field.dart';
import 'package:hungry_app/features/auth/views/widgets/custom_pass_field.dart';
import 'package:hungry_app/features/auth/views/widgets/login_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late TextEditingController emailController;
  late TextEditingController passController;
  late TextEditingController confirmController;
  late TextEditingController phoneController;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passController = TextEditingController();
    confirmController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
    confirmController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(120),
                SvgPicture.asset("assets/logo/hungry.svg"),
                Gap(50),
                CustomEmailField(hint: "Email", controller: emailController),
                Gap(10),
                CustomPassField(hint: "Password", controller: passController),
                Gap(10),
                CustomPassField(
                  hint: "Confirm Password",
                  controller: confirmController,
                ),
                Gap(10),
                CustomEmailField(hint: "Phone", controller: phoneController),
                Gap(50),
                CustomBtn(
                  title: "Sign up",
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (c) => LoginView()),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
