import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/home/cubits/home_cubit/home_cubit.dart';
import 'package:hungry_app/features/home/views/widgets/categories.dart';
import 'package:hungry_app/features/home/views/widgets/header.dart';
import 'package:hungry_app/features/home/views/widgets/search_text_field.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Gap(80),
                Header(name: context.read<HomeCubit>().name),
                Gap(20),
                SearchTextField(),
                Gap(20),
              ],
            ),
          ),
          Categories(),
          Gap(10),
        ],
      ),
    );
  }
}
