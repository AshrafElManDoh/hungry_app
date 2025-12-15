import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:hungry_app/features/auth/views/login_view.dart';
import 'package:hungry_app/core/widgets/please_login_body.dart';
import 'package:hungry_app/features/orderHistory/views/widgets/user_order_history_body.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final cubit = context.watch<AuthCubit>();
        final isGuest = cubit.isGuestMode;
        return Scaffold(
          backgroundColor: isGuest ? AppColors.primaryColor : null,
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
              : UserOrderHistoryBody(),
        );
      },
    );
  }
}
