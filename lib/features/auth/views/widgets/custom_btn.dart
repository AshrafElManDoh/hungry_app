import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.title,
    this.onTap,
    this.isFilled = true,
  });
  final String title;
  final Function()? onTap;
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: isFilled ? Colors.white : AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2,color: Colors.white)
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isFilled ? AppColors.primaryColor : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
