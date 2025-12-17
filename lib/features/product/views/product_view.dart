import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/utils/app_styles.dart';
import 'package:hungry_app/core/utils/service_locator.dart';
import 'package:hungry_app/core/widgets/price_button_widget.dart';
import 'package:hungry_app/features/home/data/models/product_model.dart';
import 'package:hungry_app/features/product/cubits/product_cubit/product_cubit.dart';
import 'package:hungry_app/features/product/data/repos/product_repo_imp.dart';
import 'package:hungry_app/features/product/views/widgets/extra_section.dart';
import 'package:hungry_app/features/product/views/widgets/spicy_widget.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key, required this.productModel});
  final ProductModel productModel ;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CachedNetworkImage(imageUrl: widget.productModel.image,height: MediaQuery.of(context).size.width * 0.5,),
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
              ExtraSection(),
            ],
          ),
        ),
        bottomNavigationBar: PriceButtonWidget(
          titleButton: "Add to cart",
          price: widget.productModel.price,
          onTap: () {},
        ),
      ),
    );
  }
}
