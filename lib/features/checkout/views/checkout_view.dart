import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/widgets/custom_indicator.dart';
import 'package:hungry_app/core/widgets/dialog/error_dialog.dart';
import 'package:hungry_app/core/widgets/dialog/show_custom_dialog.dart';
import 'package:hungry_app/core/widgets/dialog/success_dialog.dart';
import 'package:hungry_app/core/widgets/price_button_widget.dart';
import 'package:hungry_app/features/auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:hungry_app/features/auth/views/login_view.dart';
import 'package:hungry_app/core/widgets/please_login_body.dart';
import 'package:hungry_app/features/cart/cubits/cart_cubit/cart_cubit.dart';
import 'package:hungry_app/features/cart/data/models/cart_request_model.dart';
import 'package:hungry_app/features/checkout/views/widgets/user_checkout_body.dart';
import 'package:hungry_app/features/orderHistory/cubits/save_order/save_order_cubit.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.totalPrice});
  final String totalPrice;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final cubit = context.watch<AuthCubit>();
        final saveOrderCubit = context.read<SaveOrderCubit>();
        final isGuest = cubit.isGuestMode;
        return Scaffold(
          backgroundColor: isGuest ? AppColors.primaryColor : null,
          appBar: AppBar(
            backgroundColor: isGuest ? AppColors.primaryColor : null,
            foregroundColor: isGuest ? Colors.white : null,
          ),
          body: isGuest
              ? PleaseLoginBody(
                  onLoginTap: () async {
                    await cubit.clearData();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginView()),
                      (route) => false,
                    );
                  },
                )
              : UserCheckoutBody(price: double.parse(totalPrice)),
          bottomNavigationBar: isGuest
              ? null
              : BlocConsumer<SaveOrderCubit, SaveOrderState>(
                  listener: (context, state) {
                    if (state is SaveOrderSuccess) {
                      showCustomDialaog(context, SuccessDialog(msg: state.msg));
                    } else if (state is SaveOrderFailure) {
                      showCustomDialaog(
                        context,
                        ErrorDialog(message: state.errMsg),
                      );
                    }
                  },
                  builder: (context, state) {
                    final isLoading = state is SaveOrderLoading;
                    return PriceButtonWidget(
                      titleButton: isLoading ? "Processing...." : "Pay now",
                      price: (double.parse(totalPrice) + 5 + 5).toStringAsFixed(
                        2,
                      ),
                      onTap: isLoading
                          ? () {}
                          : () async{
                              showCustomDialaog(
                                context,
                                CustomIndicator(color: AppColors.primaryColor),
                              );
                              await saveOrderCubit.saveOrder(
                                CartRequestModel(
                                  context
                                      .read<CartCubit>()
                                      .convertCartDataModelToCartRequestModel(),
                                ),
                              );
                            },
                    );
                  },
                ),
        );
      },
    );
  }
}
