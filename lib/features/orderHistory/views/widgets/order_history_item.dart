import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/orderHistory/data/models/order_history_model.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../cart/views/widgets/cart_btn.dart';

class OrderHistoryItem extends StatelessWidget {
  const OrderHistoryItem({super.key, required this.item});
  final OrderHistoryModel item ;

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
                    Image.network(item.image, height: 100),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.status, style: AppStyles.style16()),
                    Text(
                      item.createdAt,
                      style: AppStyles.style16().copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      item.totalPrice,
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
