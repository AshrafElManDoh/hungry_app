import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_styles.dart';
import 'cart_btn.dart';
import 'counter_widget.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.count, required this.onChanged});
  final int count ;
  final void Function(int value) onChanged ;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/splash/splash.png", height: 100),
                Text("Hamburger", style: AppStyles.style16()),
                Text(
                  "Veggie Burger",
                  style: AppStyles.style16().copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CounterWidget(value: count, onChanged: onChanged),
                Gap(16),
                CartBtn(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
