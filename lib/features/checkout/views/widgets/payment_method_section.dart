import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/checkout/views/widgets/payment_item.dart';

import '../../../../core/utils/app_styles.dart';

class PaymentMethodSection extends StatefulWidget {
  const PaymentMethodSection({super.key});

  @override
  State<PaymentMethodSection> createState() => _PaymentMethodSectionState();
}

class _PaymentMethodSectionState extends State<PaymentMethodSection> {
  String selectedValue = "cash";
  bool isSaved = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Payment method", style: AppStyles.style20()),
        Gap(20),
        GestureDetector(
           onTap: () {
            setState(() => selectedValue = 'cash');
          },
          child: PaymentItem(
            selectedValue: selectedValue,
            tileColor: Color(0xff3C2F2F),
            title: "Cash on Delivery",
            value: "cash",
            imagePath: "assets/icon/cash.png",
            onChanged: (v) {
              setState(() => selectedValue = v!);
            },
          ),
        ),
        Gap(20),
        GestureDetector(
          onTap: () {
            setState(() => selectedValue = 'card');
          },
          child: PaymentItem(
            selectedValue: selectedValue,
            onChanged: (v) {
              setState(() => selectedValue = v!);
            },
            tileColor: Colors.black,
            imagePath: "assets/icon/visa.png",
            title: "Debit card",
            subTitle: "xxxx xxxx xxxx 2501",
            value: "card",
          ),
        ),
        Gap(10),
        Row(
          children: [
            Checkbox(
              value: isSaved,
              activeColor: AppColors.primaryColor,
              onChanged: (value) {
                setState(() => isSaved = !isSaved);
              },
            ),
            Gap(5),
            Text("Save card details for future payments"),
          ],
        ),
      ],
    );
  }
}
