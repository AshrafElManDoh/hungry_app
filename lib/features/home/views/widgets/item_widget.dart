import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

import '../../../../core/utils/app_styles.dart';
import '../../data/item_model.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(item.image, height: 120),
            Gap(10),
            Text(item.title, style: AppStyles.style16()),
            Text(
              item.subtitle,
              style: AppStyles.style16().copyWith(fontWeight: FontWeight.w400),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("⭐ ${item.rate}"),
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.favorite, color: AppColors.primaryColor),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
