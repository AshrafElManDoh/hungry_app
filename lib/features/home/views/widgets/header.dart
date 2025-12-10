import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/utils/app_pref_helpers.dart';
import 'package:hungry_app/core/utils/app_styles.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final name = AppPrefHelpers.loadData(AppPrefHelpers.usernameKey) as String? ?? "";
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/logo/hungry.svg",
              height: 40,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),Gap(10),
            Text("Hello ,$name",style: AppStyles.style18(),),
          ],
        ),Spacer(),
        CircleAvatar(
          radius: 35,
        ),
      ],
    );
  }
}
