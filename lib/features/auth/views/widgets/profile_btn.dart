import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/utils/app_styles.dart';

class ProfileBtn extends StatelessWidget {
  const ProfileBtn({
    super.key,
    required this.text,
    required this.isFilled,
    this.onTap,
    this.iconPath,
  });
  final String text;
  final String? iconPath;
  final bool isFilled;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isFilled ? Colors.white : null,
          border: isFilled ? null : Border.all(color: Colors.white),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppStyles.style18().copyWith(
                color: isFilled ? AppColors.primaryColor : Colors.white,
              ),
            ),
            iconPath != null ? Gap(5) : SizedBox.shrink(),
            iconPath != null
                ? SvgPicture.asset(iconPath!, height: 16)
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
