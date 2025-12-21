import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/utils/app_pref_helpers.dart';
import 'package:hungry_app/features/auth/views/profile_view.dart';
import 'package:hungry_app/features/cart/cubits/cart_cubit/cart_cubit.dart';
import 'package:hungry_app/features/cart/views/cart_view.dart';
import 'package:hungry_app/features/home/views/home_view.dart';
import 'package:hungry_app/features/orderHistory/views/order_history_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController controller;
  int currentPage = 0;
  late bool isGuest;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentPage);
    isGuest = AppPrefHelpers.loadData(AppPrefHelpers.tokenKey) != null ? false: true;
    if (!isGuest) {
      context.read<CartCubit>().getCartItems();
    }
  }

  List<Widget> views = [
    HomeView(),
    CartView(),
    OrderHistoryView(),
    ProfileView(),
  ];

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart), label: "Cart"),
    BottomNavigationBarItem(
      icon: Icon(Icons.fastfood_outlined),
      label: "OrderHistory",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_2_outlined),
      label: "profile",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          currentPage = index;
        },
        children: views,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: CupertinoTabBar(
          backgroundColor: AppColors.primaryColor,
          currentIndex: currentPage,
          height: 72,
          activeColor: Colors.white,
          inactiveColor: Colors.grey.shade600,
          onTap: (value) => setState(() {
            controller.jumpToPage(value);
          }),
          items: items,
        ),
      ),
    );
  }
}
