import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

import '../../../../core/utils/app_styles.dart';
import '../../data/models/product_model.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.item});

  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(aspectRatio: 1,child: Image.network(item.image,)),
            // Gap(10),
            Text(item.name, style: AppStyles.style16()),
            Text(
              item.description,
              style: AppStyles.style14().copyWith(color: Colors.grey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("⭐ ${item.rating}"),
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
