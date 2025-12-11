import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/utils/app_pref_helpers.dart';
import 'package:hungry_app/features/home/data/item_model.dart';
import 'package:hungry_app/features/home/views/widgets/categories.dart';
import 'package:hungry_app/features/home/views/widgets/header.dart';
import 'package:hungry_app/features/home/views/widgets/item_widget.dart';
import 'package:hungry_app/features/home/views/widgets/search_text_field.dart';
import 'package:hungry_app/features/product/views/product_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<ItemModel> items = [
    ItemModel(
      image: "assets/splash/splash.png",
      title: "Cheeseburger",
      subtitle: "Wendy's Burger",
      rate: 4.6,
    ),
    ItemModel(
      image: "assets/splash/splash.png",
      title: "Cheeseburger",
      subtitle: "Wendy's Burger",
      rate: 4.6,
    ),
    ItemModel(
      image: "assets/splash/splash.png",
      title: "Cheeseburger",
      subtitle: "Wendy's Burger",
      rate: 4.6,
    ),
    ItemModel(
      image: "assets/splash/splash.png",
      title: "Cheeseburger",
      subtitle: "Wendy's Burger",
      rate: 4.6,
    ),
    ItemModel(
      image: "assets/splash/splash.png",
      title: "Cheeseburger",
      subtitle: "Wendy's Burger",
      rate: 4.6,
    ),
    ItemModel(
      image: "assets/splash/splash.png",
      title: "Cheeseburger",
      subtitle: "Wendy's Burger",
      rate: 4.6,
    ),
    ItemModel(
      image: "assets/splash/splash.png",
      title: "Cheeseburger",
      subtitle: "Wendy's Burger",
      rate: 4.6,
    ),
    ItemModel(
      image: "assets/splash/splash.png",
      title: "Cheeseburger",
      subtitle: "Wendy's Burger",
      rate: 4.6,
    ),
    ItemModel(
      image: "assets/splash/splash.png",
      title: "Cheeseburger",
      subtitle: "Wendy's Burger",
      rate: 4.6,
    ),
    ItemModel(
      image: "assets/splash/splash.png",
      title: "ChickenBurger",
      subtitle: "Wendy's Burger",
      rate: 4.8,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final itemWidth = (size.width - 16 * 2 - 10) / 2;
    final itemHeight = itemWidth * 1.5;
    final aspectRatio = itemWidth / itemHeight;
    final name = AppPrefHelpers.loadData(AppPrefHelpers.usernameKey) as String? ?? "";
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Gap(80),
                    Header(name: name,),
                    Gap(20),
                    SearchTextField(),
                    Gap(20),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(children: const [Categories(), Gap(10)]),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: items.length,
                  (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductView()),
                      );
                    },
                    child: ItemWidget(item: items[index]),
                  ),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: aspectRatio,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
              ),
            ),
            SliverToBoxAdapter(child: Gap(110),),
          ],
        ),
      ),
    );
  }
}
