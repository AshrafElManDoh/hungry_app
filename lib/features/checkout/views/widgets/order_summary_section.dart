import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_styles.dart';

class OrderHistorySection extends StatelessWidget {
  const OrderHistorySection({
    super.key,
    required this.order,
    required this.taxes,
    required this.fees,
  });
  final double order, taxes, fees;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Order Summary", style: AppStyles.style20()),
        Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildRowText(title: "Order", price: order),
              Gap(10),
              buildRowText(title: "Taxes", price: taxes),
              Gap(10),
              buildRowText(title: "Delivery Fees", price: fees),
              Gap(10),
              Divider(),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: AppStyles.style20()),
                  Text("\$${order + taxes + fees}", style: AppStyles.style20()),
                ],
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Estimated delivery time:",
                    style: AppStyles.style16().copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "15 - 30 mins",
                    style: AppStyles.style16().copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row buildRowText({required String title, required double price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppStyles.style18()),
        Text("\$$price", style: AppStyles.style18()),
      ],
    );
  }
}
