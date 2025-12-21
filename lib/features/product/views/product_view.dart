import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/utils/app_styles.dart';
import 'package:hungry_app/core/utils/service_locator.dart';
import 'package:hungry_app/core/widgets/price_button_widget.dart';
import 'package:hungry_app/features/cart/cubits/cart_cubit/cart_cubit.dart';
import 'package:hungry_app/features/cart/data/models/cart_model.dart';
import 'package:hungry_app/features/home/data/models/product_model.dart';
import 'package:hungry_app/features/product/cubits/product_cubit/product_cubit.dart';
import 'package:hungry_app/features/product/data/repos/product_repo_imp.dart';
import 'package:hungry_app/features/product/views/widgets/extra_section.dart';
import 'package:hungry_app/features/product/views/widgets/spicy_counter_widget.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductCubit(getIt.get<ProductRepoImp>())..loadProductOptions(),
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: productModel.image,
                      height: MediaQuery.of(context).size.width * 0.7,
                    ),
                    Text(productModel.name, style: AppStyles.style20()),
                    Gap(10),
                    Text(productModel.description, style: AppStyles.style18()),
                    Gap(10),
                    SpicyCounterWidget(),
                  ],
                ),
              ),
              ExtraSection(),
              Gap(30),
            ],
          ),
        ),
        bottomNavigationBar: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            if (state is CartAddItem) {
              Navigator.pop(context, state.msg);
            } else if (state is CartFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errMsg)));
            }
          },
          builder: (context, state) {
            final productCubit = context.watch<ProductCubit>();
            final isLoading = state is CartAddLoading;

            return PriceButtonWidget(
              titleButton: "Add to cart",
              price: productCubit
                  .calcTotal(productModel.price)
                  .toStringAsFixed(2),
              isLoading: isLoading,
              onTap: isLoading
                  ? () {}
                  : () {
                      context.read<CartCubit>().addToCart(
                        CartModel(
                          productId: productModel.id,
                          quantity: productCubit.itemQty,
                          spicy: productCubit.spicyLevel,
                          toppings: productCubit.selectedToppings.toList(),
                          sideOptions: productCubit.selectedSideOptions
                              .toList(),
                        ),
                      );
                    },
            );
          },
        ),
      ),
    );
  }
}
