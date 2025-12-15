import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/utils/app_styles.dart';
import 'package:hungry_app/features/auth/views/widgets/profile_btn.dart';

class PleaseLoginBody extends StatelessWidget {
  const PleaseLoginBody({super.key, required this.onLoginTap,});
  final VoidCallback onLoginTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Please login",
            style: AppStyles.style20().copyWith(color: Colors.white),
          ),
          Gap(20),
          ProfileBtn(
            text: "Login",
            isFilled: true,
            onTap: onLoginTap,
          ),
        ],
      ),
    );
  }
}