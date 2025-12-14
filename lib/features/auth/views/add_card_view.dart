import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/widgets/general_btn.dart';
import 'package:hungry_app/features/auth/cubits/auth_cubit/auth_cubit.dart';

class AddCardView extends StatefulWidget {
  const AddCardView({super.key});

  @override
  State<AddCardView> createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCardWidget(
              cardBgColor: AppColors.primaryColor,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              isHolderNameVisible: true,
              cvvCode: cvvCode,
              obscureCardCvv: false,
              showBackView: showBackView,
              onCreditCardWidgetChange: (brand) {},
            ),
            CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              isCardHolderNameUpperCase: true,
              onCreditCardModelChange: (model) {
                setState(() {
                  cardNumber = model.cardNumber;
                  expiryDate = model.expiryDate;
                  cardHolderName = model.cardHolderName;
                  cvvCode = model.cvvCode;
                  showBackView = model.isCvvFocused;
                });
              },
              formKey: formKey,
            ),
            Gap(50),
            GeneralBtn(
              onTap: () {
                context.read<AuthCubit>().setCard(cardNumber);
                Navigator.pop(context);
              },
              titleButton: "Add Card",
            ),
            Gap(70),
          ],
        ),
      ),
    );
  }
}
