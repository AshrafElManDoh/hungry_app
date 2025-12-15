import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/widgets/dialog/success_dialog.dart';
import 'package:hungry_app/core/widgets/price_button_widget.dart';
import 'package:hungry_app/features/auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:hungry_app/features/auth/views/login_view.dart';
import 'package:hungry_app/core/widgets/please_login_body.dart';
import 'package:hungry_app/features/checkout/views/widgets/user_checkout_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final cubit = context.watch<AuthCubit>();
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
              : UserCheckoutBody(),
          bottomNavigationBar: isGuest
              ? null
              : PriceButtonWidget(
                  titleButton: "Pay now",
                  onTap: () {
                    showCustomDialaog(context);
                  },
                ),
        );
      },
    );
  }
}
