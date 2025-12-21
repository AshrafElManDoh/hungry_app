import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/widgets/custom_indicator.dart';
import 'package:hungry_app/core/widgets/price_button_widget.dart';
import 'package:hungry_app/features/cart/cubits/cart_cubit/cart_cubit.dart';
import 'package:hungry_app/features/cart/views/widgets/cart_item.dart';
import 'package:hungry_app/features/checkout/views/checkout_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errMsg)));
          }
        },
        builder: (context, state) {
          final cartCubit = context.read<CartCubit>();
          final isLoading =
              state is CartLoading ||
              state is CartremoveLoading ||
              state is CartAddItem;

          return ModalProgressHUD(
            inAsyncCall: isLoading,
            progressIndicator: const CustomIndicator(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: Gap(40)),

                  /// 🛒 Cart Items
                  if (state is CartGetItems || state is CartremoveLoading)
                    SliverList.builder(
                      itemCount: cartCubit.cartDataModel?.items.length ?? 0,
                      itemBuilder: (context, index) {
                        final cartItem = cartCubit.cartDataModel!.items[index];
                        return CartItem(
                          cartModel: cartItem,
                          count: cartItem.quantity,
                          onChanged: (newValue) {},
                        );
                      },
                    )
                  else if (state is CartFailure)
                    SliverFillRemaining(
                      child: Center(child: Text(state.errMsg)),
                    )
                  else
                    SliverFillRemaining(
                      child: Center(
                        child: CustomIndicator(color: AppColors.primaryColor),
                      ),
                    ),

                  const SliverToBoxAdapter(child: Gap(200)),
                ],
              ),
            ),
          );
        },
      ),

      /// 💰 Checkout Button
      bottomSheet: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final totalPrice =
              context.read<CartCubit>().cartDataModel?.totalPrice ?? "0.0";

          return PriceButtonWidget(
            isBottomNavBar: false,
            titleButton: "Check out",
            price: totalPrice,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CheckoutView()),
            ),
          );
        },
      ),
    );
  }
}
