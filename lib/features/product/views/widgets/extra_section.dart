import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/utils/app_styles.dart';
import 'package:hungry_app/core/widgets/custom_indicator.dart';
import 'package:hungry_app/features/product/cubits/product_cubit/product_cubit.dart';
import 'package:hungry_app/features/product/views/widgets/extra_widget.dart';

class ExtraSection extends StatelessWidget {
  const ExtraSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return Column(
            children: [
              Gap(32),
              ExtraWidget(title: "Toppings", list: state.toppings),
              Gap(32),
              ExtraWidget(title: "Side Options", list: state.sideOptions),
            ],
          );
        } else if (state is ProductFailure) {
          return Center(
            child: Text("Something went wrong !", style: AppStyles.style20()),
          );
        } else {
          return Center(child: CustomIndicator(color: Colors.black,));
        }
      },
    );
  }
}
