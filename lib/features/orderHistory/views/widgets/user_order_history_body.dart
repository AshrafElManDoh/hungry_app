import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/utils/app_styles.dart';
import 'package:hungry_app/core/widgets/custom_indicator.dart';
import 'package:hungry_app/features/orderHistory/cubits/order_history/order_history_cubit.dart';
import 'package:hungry_app/features/orderHistory/views/widgets/order_history_item.dart';

class UserOrderHistoryBody extends StatelessWidget {
  const UserOrderHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<OrderHistoryCubit, OrderHistoryState>(
        builder: (context, state) {
          if (state is OrderHistorySuccess) {
            return ListView.separated(
              itemBuilder: (context, index) => OrderHistoryItem(item: state.items[index],),
              separatorBuilder: (context, index) => Gap(10),
              itemCount: state.items.length,
            );
          } else if (state is OrderHistoryFailure) {
            return Center(
              child: Text(state.errMsg, style: AppStyles.style20()),
            );
          } else {
            return Center(child: CustomIndicator(color: AppColors.primaryColor));
          }
        },
      ),
    );
  }
}
