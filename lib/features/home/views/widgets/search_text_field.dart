import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(15),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          prefixIcon: Icon(CupertinoIcons.search,),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder()
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(15),
      );
  }
}
