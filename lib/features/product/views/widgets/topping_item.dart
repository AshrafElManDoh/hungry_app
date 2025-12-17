import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/product/data/models/topping_model.dart';

class ToppingItem extends StatelessWidget {
  const ToppingItem({
    super.key,
    required this.item,
    required this.onTap,
    required this.isSelected,
  });
  final ToppingModel item;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: buildBorderRadius(),
      child: Container(
        height: 100,
        width: 85,
        decoration: BoxDecoration(
          color: Color(0xff3C2F2F),
          borderRadius: buildBorderRadius(),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 60,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: buildBorderRadius(),
                color: Colors.white,
              ),
              child: CachedNetworkImage(imageUrl: item.image),
            ),
            Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  item.name,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: Center(
                    child: IconButton(
                      onPressed: onTap,
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        isSelected ? Icons.check : Icons.add,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BorderRadius buildBorderRadius() => BorderRadius.circular(18);
}
