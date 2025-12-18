import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/utils/app_styles.dart';
import 'package:hungry_app/features/cart/views/widgets/counter_widget.dart';
import 'package:hungry_app/features/product/cubits/product_cubit/product_cubit.dart';
import 'package:hungry_app/features/product/views/widgets/spicy_widget.dart';

class SpicyCounterWidget extends StatelessWidget {
  const SpicyCounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final cubit = context.read<ProductCubit>();
        return Column(
          children: [
            SpicyWidget(
              value: cubit.spicyLevel,
              onChanged: cubit.onChangeSpicy,
            ),
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Quantity : ",style: AppStyles.style20(),),
                CounterWidget(
                  value: cubit.itemQty,
                  onChanged: cubit.onChangeCounter,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
