import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/product/data/models/topping_model.dart';
import 'package:hungry_app/features/product/views/widgets/topping_item.dart';

import '../../../../core/utils/app_styles.dart';

class ExtraWidget extends StatelessWidget {
  const ExtraWidget({super.key, required this.title, required this.list});

  final String title;
  final List<ToppingModel> list;

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(
      list.length,
      (index) => ToppingItem(item: list[index]),
    );
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
          child: Row(spacing: 10, children: [Gap(8), ...items, Gap(8)]),
        ),
      ],
    );
  }
}
