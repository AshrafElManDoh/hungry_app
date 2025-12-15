import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/utils/app_styles.dart';
import 'package:hungry_app/core/widgets/general_btn.dart';
import 'package:hungry_app/root.dart';

Future<dynamic> showCustomDialaog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          height: 400,
          width: 400,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: AppColors.primaryColor,
                child: Icon(
                  CupertinoIcons.checkmark_alt,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              // Gap(10),
              Text(
                "Success !",
                style: AppStyles.style32().copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              // Gap(10),
              Text(
                "Your payment was successful.\nA receipt for this purchase has been sent to your email.",
                textAlign: TextAlign.center,
                style: AppStyles.style14().copyWith(color: Colors.grey),
              ),
              // Gap(30),
              GeneralBtn(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Root()),
                    (route) => false,
                  );
                },
                titleButton: "Go Back",
              ),
            ],
          ),
        ),
      ),
    );
  }