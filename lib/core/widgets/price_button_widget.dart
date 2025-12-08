import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../utils/app_styles.dart';
import 'general_btn.dart';

class PriceButtonWidget extends StatelessWidget {
  const PriceButtonWidget({
    super.key,
    required this.titleButton,
    required this.onTap, this.isBottomNavBar =true,
  });
  final String titleButton;
  final bool isBottomNavBar ;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: isBottomNavBar ? 100 : 175,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total",
                  style: AppStyles.style18().copyWith(color: Colors.black),
                ),
                Gap(5),
                Text("\$ 18.9", style: AppStyles.style32()),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: GeneralBtn(onTap: onTap, titleButton: titleButton),
            ),
          ],
        ),
      ),
    );
  }
}
