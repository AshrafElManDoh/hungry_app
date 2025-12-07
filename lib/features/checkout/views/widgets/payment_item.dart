import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    super.key,
    required this.selectedValue,
    required this.onChanged,
    required this.tileColor,
    required this.title,
    this.subTitle,
    required this.value,
    required this.imagePath,
  });
  final String selectedValue, title, value,imagePath;
  final void Function(String?) onChanged;
  final Color tileColor;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: tileColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      leading: Image.asset(imagePath,width: 70,),
      title: Text(
        title,
        style: AppStyles.style18().copyWith(color: Colors.white),
      ),
      subtitle: subTitle == null ? null : Text(subTitle!),
      subtitleTextStyle: TextStyle(color: Colors.grey),
      trailing: Radio<String>(
        value: value,
        groupValue: selectedValue,
        activeColor: Colors.white,
        onChanged: onChanged,
      ),
    );
  }
}
