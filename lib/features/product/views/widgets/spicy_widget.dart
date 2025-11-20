import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class SpicyWidget extends StatefulWidget {
  const SpicyWidget({super.key});

  @override
  State<SpicyWidget> createState() => _SpicyWidgetState();
}

class _SpicyWidgetState extends State<SpicyWidget> {
  double sliderValue = 0;

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
                value: sliderValue,
                activeColor: AppColors.primaryColor,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
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
