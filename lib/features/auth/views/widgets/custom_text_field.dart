import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint, required this.controller});
  final String hint ;
  final TextEditingController controller ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      controller: controller,
      style: TextStyle(color: AppColors.primaryColor),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (v){
        if(v == null || v.isEmpty)
          {
            return 'This field is required' ;
          }
        return null ;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.amberAccent),
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        border: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      );
  }
}
