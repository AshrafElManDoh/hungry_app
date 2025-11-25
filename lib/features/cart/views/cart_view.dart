import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/widgets/price_button_widget.dart';
import 'package:hungry_app/features/cart/views/widgets/cart_item.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List<int> quantities = List.generate(5, (index) => 1);
  void onChanged(int newValue, int index) {
    setState(() {
      if (newValue >= 1) {
        quantities[index] = newValue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          itemBuilder: (context, index) => CartItem(
            count: quantities[index],
            onChanged: (newValue) => onChanged(newValue, index),
          ),
          separatorBuilder: (context, index) => Gap(10),
          itemCount: 5,
        ),
      ),
      bottomNavigationBar: PriceButtonWidget(
        titleButton: "Check out",
        onTap: () {},
      ),
    );
  }
}
