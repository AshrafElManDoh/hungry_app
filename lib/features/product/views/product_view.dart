import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/utils/app_styles.dart';
import 'package:hungry_app/core/widgets/price_button_widget.dart';
import 'package:hungry_app/features/product/views/widgets/extra_widget.dart';
import 'package:hungry_app/features/product/views/widgets/spicy_widget.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/test/product.png", height: 280),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Customize Your Burger\nto Your Tastes.\nUltimate Experience",
                          style: AppStyles.style16().copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Gap(30),
                        SpicyWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Gap(32),
            ExtraWidget(title: "Toppings"),
            Gap(32),
            ExtraWidget(title: "Side Options"),
          ],
        ),
      ),
      bottomNavigationBar: PriceButtonWidget(
        titleButton: "Add to cart",
        onTap: () {},
      ),
    );
  }
}
