import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/checkout/views/widgets/order_summary_section.dart';
import 'package:hungry_app/features/checkout/views/widgets/payment_method_section.dart';

class UserCheckoutBody extends StatelessWidget {
  const UserCheckoutBody({super.key, required this.price});
  final double price ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderHistorySection(order: price, taxes: 5, fees: 5),
          Gap(20),
          PaymentMethodSection(),
        ],
      ),
    );
  }
}
