import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/product/data/models/topping_model.dart';
import 'package:hungry_app/features/product/views/widgets/topping_item.dart';

import '../../../../core/utils/app_styles.dart';

class ExtraWidget extends StatelessWidget {
  const ExtraWidget({
    super.key,
    required this.title,
    required this.list,
    required this.selectedIds,
    required this.onTap,
  });

  final String title;
  final List<ToppingModel> list;
  final Set<int> selectedIds;
  final void Function(int id) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: AppStyles.style18().copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Gap(16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 10,
            children: [
              const Gap(10),
              ...list.map(
                (item) => ToppingItem(
                  item: item,
                  isSelected: selectedIds.contains(item.id),
                  onTap: () => onTap(item.id),
                ),
              ),
              const Gap(10),
            ],
          ),
        ),
      ],
    );
  }
}
