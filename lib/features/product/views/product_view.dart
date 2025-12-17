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
                    SpicyWidget(),
                  ],
                ),
              ),
              ExtraSection(),
              Gap(30),
            ],
          ),
        ),
        bottomNavigationBar: PriceButtonWidget(
          titleButton: "Add to cart",
          price: productModel.price,
          onTap: () {},
        ),
      ),
    );
  }
}
