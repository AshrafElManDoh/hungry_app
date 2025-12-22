import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/widgets/custom_indicator.dart';
import 'package:hungry_app/features/cart/cubits/cart_cubit/cart_cubit.dart';
import 'package:hungry_app/features/cart/views/widgets/cart_item.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
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
                    hasScrollBody: true,
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await context.read<CartCubit>().getCartItems();
                      },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: Center(child: Text(state.errMsg)),
                        ),
                      ),
                    ),
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
    );
  }
}
