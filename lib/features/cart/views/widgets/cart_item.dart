import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/cart/cubits/cart_cubit/cart_cubit.dart';
import 'package:hungry_app/features/cart/data/models/cart_item_model.dart';

import '../../../../core/utils/app_styles.dart';
import 'cart_btn.dart';
import 'counter_widget.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.count,
    required this.onChanged,
    required this.cartModel,
  });
  final int count;
  final CartItemModel cartModel;
  final void Function(int value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl: cartModel.image,
                        height: 100,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          cartModel.name,
                          style: AppStyles.style16(),
                          maxLines: 1,
                        ),
                      ),
                      Text(
                        "\$${cartModel.price}",
                        style: AppStyles.style16().copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CounterWidget(value: count, onChanged: onChanged),
                    Gap(16),
                    CartBtn(
                      title: "Remove",
                      onTap: () => context.read<CartCubit>().removeFromCart(
                        cartModel.itemId,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            cartModel.toppings.isNotEmpty || cartModel.sideOptions.isNotEmpty
                ? Column(
                    children: [Text("Extras :", style: AppStyles.style16())],
                  )
                : SizedBox.shrink(),
            cartModel.toppings.isNotEmpty
                ? Row(
                    spacing: 5,
                    children: List.generate(
                      cartModel.toppings.length,
                      (index) => buildCustomExtra(
                        index,
                        cartModel.toppings[index].image,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            cartModel.sideOptions.isNotEmpty
                ? Row(
                    spacing: 5,
                    children: List.generate(
                      cartModel.sideOptions.length,
                      (index) => buildCustomExtra(
                        index,
                        cartModel.sideOptions[index].image,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Container buildCustomExtra(int index, String imageUrl) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CachedNetworkImage(height: 40, width: 40, imageUrl: imageUrl),
    );
  }
}
