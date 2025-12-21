import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/home/cubits/home_cubit/home_cubit.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(15),
      child: TextField(
        onChanged: (value){
          context.read<HomeCubit>().searchProducts(value);
        },
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
