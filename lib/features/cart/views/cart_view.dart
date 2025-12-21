import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/widgets/please_login_body.dart';
import 'package:hungry_app/core/widgets/price_button_widget.dart';
import 'package:hungry_app/features/auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:hungry_app/features/auth/views/login_view.dart';
import 'package:hungry_app/features/cart/cubits/cart_cubit/cart_cubit.dart';
import 'package:hungry_app/features/cart/views/widgets/cart_body.dart';
import 'package:hungry_app/features/checkout/views/checkout_view.dart';



class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        final authCubit = context.read<AuthCubit>();
        final isGuest = authCubit.isGuestMode;

        return Scaffold(
          backgroundColor: isGuest ? AppColors.primaryColor : null,
          body: isGuest
              ? PleaseLoginBody(
                  onLoginTap: () async {
                    await authCubit.clearData();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginView(),
                      ),
                      (route) => false,
                    );
                  },
                )
              : CartBody(),

          /// 👈 أهم حتة: bottomSheet مش هيظهر لو Guest
          bottomSheet: isGuest ? null : const _CartBottomSheet(),
        );
      },
    );
  }
}




class _CartBottomSheet extends StatelessWidget {
  const _CartBottomSheet();

  @override
  Widget build(BuildContext context) {
    final totalPrice =
        context.watch<CartCubit>().cartDataModel?.totalPrice ?? "0.0";

    return PriceButtonWidget(
      isBottomNavBar: false,
      titleButton: "Check out",
      price: totalPrice,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CheckoutView(totalPrice: totalPrice),
        ),
      ),
    );
  }
}
