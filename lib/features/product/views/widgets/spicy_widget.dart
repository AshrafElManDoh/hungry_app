import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class SpicyWidget extends StatelessWidget {
  const SpicyWidget({super.key, required this.value, required this.onChanged});
  final double value;
  final void Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text("Spicy", style: AppStyles.style16()),
        ),
        SizedBox(
          width: 300,
          child: Column(
            children: [
              Slider(
                value: value,
                activeColor: AppColors.primaryColor,
                onChanged: onChanged,
                divisions: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("🥶", style: AppStyles.style18()),
                    Text("🌶", style: AppStyles.style18()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
