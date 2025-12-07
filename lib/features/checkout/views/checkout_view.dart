import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/utils/app_styles.dart';
import 'package:hungry_app/core/widgets/general_btn.dart';
import 'package:hungry_app/core/widgets/price_button_widget.dart';
import 'package:hungry_app/features/checkout/views/widgets/order_summary_section.dart';
import 'package:hungry_app/features/checkout/views/widgets/payment_method_section.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderHistorySection(order: 30, taxes: 5, fees: 5),
            Gap(20),
            PaymentMethodSection(),
          ],
        ),
      ),
      bottomNavigationBar: PriceButtonWidget(
        titleButton: "Pay now",
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              child: Container(
                height: 400,
                width: 400,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(
                        CupertinoIcons.checkmark_alt,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    // Gap(10),
                    Text(
                      "Success !",
                      style: AppStyles.style32().copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    // Gap(10),
                    Text(
                      "Your payment was successful.\nA receipt for this purchase has been sent to your email.",
                      textAlign: TextAlign.center,
                      style: AppStyles.style14().copyWith(color: Colors.grey),
                    ),
                    // Gap(30),
                    GeneralBtn(onTap: () {}, titleButton: "Go Back"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
