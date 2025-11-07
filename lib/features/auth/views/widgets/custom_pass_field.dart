import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class CustomPassField extends StatefulWidget {
  const CustomPassField({
    super.key,
    required this.hint,
    required this.controller,
  });
  final String hint;
  final TextEditingController controller;

  @override
  State<CustomPassField> createState() => _CustomPassFieldState();
}

class _CustomPassFieldState extends State<CustomPassField> {
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(color: AppColors.primaryColor),
      validator: (v) {
        if (v == null || v.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      obscureText: isObsecure,

      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.amberAccent),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isObsecure = !isObsecure;
            });
          },
          icon: Icon(
            isObsecure ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
          ),
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        border: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(borderRadius: BorderRadius.circular(20));
  }
}
