import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/views/widgets/profile_btn.dart';
import 'package:hungry_app/features/auth/views/widgets/profile_text_field.dart';
import 'package:hungry_app/features/checkout/views/widgets/payment_item.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late TextEditingController _nameCont;
  late TextEditingController _emailCont;
  late TextEditingController _addCont;
  late TextEditingController _passCont;

  @override
  void initState() {
    _nameCont = TextEditingController();
    _emailCont = TextEditingController();
    _addCont = TextEditingController();
    _passCont = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameCont.dispose();
    _addCont.dispose();
    _emailCont.dispose();
    _passCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Image.asset("assets/icon/Group.png", width: 20),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(30),
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white, width: 3),
                ),
              ),
              Gap(40),
              ProfileTextField(controller: _nameCont, labelText: "Name"),
              Gap(10),
              ProfileTextField(controller: _emailCont, labelText: "Email"),
              Gap(10),
              ProfileTextField(controller: _addCont, labelText: "Address"),
              Gap(10),
              ProfileTextField(controller: _passCont, labelText: "Password"),
              Gap(40),
              Divider(color: Colors.white),
              Gap(40),
              PaymentItem(
                selectedValue: "cart",
                onChanged: (c) {},
                tileColor: Colors.black,
                subTitle: "xxxx xxxx xxxx 0261",
                title: "Debit card",
                value: "card",
                imagePath: "assets/icon/visa.png",
              ),
              Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfileBtn(
                    text: "Edit Profile",
                    imagePath: "assets/svg/edit.svg",
                    isFilled: true,
                  ),
                  ProfileBtn(
                    text: "Log out",
                    imagePath: "assets/svg/sign-out.svg",
                    isFilled: false,
                  ),
                ],
              ),
              Gap(110),
            ],
          ),
        ),
      ),
    );
  }
}
