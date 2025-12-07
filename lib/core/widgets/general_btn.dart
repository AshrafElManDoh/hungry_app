import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../utils/app_styles.dart';

class GeneralBtn extends StatelessWidget {
  const GeneralBtn({
    super.key,
    required this.onTap,
    required this.titleButton,
  });

  final void Function() onTap;
  final String titleButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          titleButton,
          style: AppStyles.style18().copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
