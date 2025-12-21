import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/utils/app_styles.dart';

class CartBtn extends StatelessWidget {
  const CartBtn({
    super.key,
    this.isWide = false,
    required this.title,
    this.onTap,
  });
  final bool isWide;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isWide ? double.infinity : 120,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: AppStyles.style16().copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
