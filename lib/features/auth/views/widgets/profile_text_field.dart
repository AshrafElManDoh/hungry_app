import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/app_styles.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({super.key, required this.controller, required this.labelText});
  final TextEditingController controller ;
  final String labelText ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppStyles.style16().copyWith(color: Colors.grey),
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: Colors.white,
        )
      );
  }
}