import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/orderHistory/views/widgets/order_history_item.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          itemBuilder: (context, index) => OrderHistoryItem(),
          separatorBuilder: (context, index) => Gap(10),
          itemCount: 5,
        ),
      ),
    );
  }
}
