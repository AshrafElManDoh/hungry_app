import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/app_styles.dart';

import '../../../../core/constants/app_colors.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
    required this.value,
    required this.onChanged,
  });
  final int value;
  final void Function(int) onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildCircleAvatar(
            icon: Icons.add,
            onTap: () {
              onChanged(value + 1);
            },
          ),
          Text(value.toString(), style: AppStyles.style16()),
          buildCircleAvatar(
            icon: Icons.remove,
            onTap: () {
              onChanged(value - 1);
            },
          ),
        ],
      ),
    );
  }

  Widget buildCircleAvatar({
    required IconData icon,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColors.primaryColor,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
