import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/app_styles.dart';

class UnderlinedText extends StatelessWidget {
  const UnderlinedText({super.key, required this.title, this.color, this.onTap});

  final String title;
  final Color? color;
  final Function()? onTap ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: color ?? Colors.white, width: 2),
          ),
        ),
        child: Text(
          title,
          style: AppStyles.style20().copyWith(color: color ?? Colors.white),
        ),
      ),
    );
  }
}
