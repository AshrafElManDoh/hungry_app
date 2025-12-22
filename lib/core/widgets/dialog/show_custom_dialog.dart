import 'package:flutter/material.dart';

Future<dynamic> showCustomDialaog(BuildContext context, Widget child) {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        height: 400,
        width: 400,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: child,
      ),
    ),
  );
}
