import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../cart/views/widgets/cart_btn.dart';

class OrderHistoryWidget extends StatelessWidget {
  const OrderHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/splash/splash.png", height: 100),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hamburger", style: AppStyles.style16()),
                    Text(
                      "Veggie Burger",
                      style: AppStyles.style16().copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Quantity : 3",
                      style: AppStyles.style16().copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Price : 30\$",
                      style: AppStyles.style16().copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Gap(16),
            CartBtn(isWide: true, title: "Reorder"),
          ],
        ),
      ),
    );
  }
}
