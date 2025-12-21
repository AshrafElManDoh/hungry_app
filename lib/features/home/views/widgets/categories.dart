import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/home/cubits/home_cubit/home_cubit.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["All", "Chicken", "Beef", "Shawarma","Family"];
  int? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: [
          Gap(10),
          ...List.generate(
            categories.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = index;
                  final category = categories[index];
                  if(category == "All"){
                    context.read<HomeCubit>().searchProducts("");
                  } else {
                    context.read<HomeCubit>().searchProducts(category);
                  }
                  
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                decoration: BoxDecoration(
                  color: selectedCategory == index
                      ? AppColors.primaryColor
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: selectedCategory == index
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Gap(10),
        ],
      ),
    );
  }
}
