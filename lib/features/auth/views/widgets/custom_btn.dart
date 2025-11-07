import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, required this.title, this.onTap});
  final String title;
  final Function()? onTap ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
