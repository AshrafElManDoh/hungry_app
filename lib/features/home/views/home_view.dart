import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/utils/service_locator.dart';
import 'package:hungry_app/core/widgets/custom_indicator.dart';
import 'package:hungry_app/features/home/cubits/home_cubit/home_cubit.dart';
import 'package:hungry_app/features/home/data/repos/home_repo_imp.dart';
import 'package:hungry_app/features/home/views/widgets/header_section.dart';
import 'package:hungry_app/features/home/views/widgets/item_widget.dart';
import 'package:hungry_app/features/product/views/product_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final itemWidth = (size.width - 16 * 2 - 10) / 2;
    // final itemHeight = itemWidth * 1.5;
    // final aspectRatio = itemWidth / itemHeight;
    return BlocProvider(
      create: (context) => HomeCubit(getIt.get<HomeRepoImp>())..loadData()..getProducts(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              HeaderSection(),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeSuccess) {
                    return SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          childCount: state.products.length,
                          (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductView(),
                                ),
                              );
                            },
                            child: ItemWidget(item: state.products[index]),
                          ),
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.65,
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                      ),
                    );
                  } else if (state is HomeFailure) {
                    return SliverToBoxAdapter(
                      child: Center(child: Text(state.errMsg)),
                    );
                  } else {
                    return SliverToBoxAdapter(child: CustomIndicator(color: AppColors.primaryColor,));
                  }
                },
              ),
              SliverToBoxAdapter(child: Gap(110)),
            ],
          ),
        ),
      ),
    );
  }
}
