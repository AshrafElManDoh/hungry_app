import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/utils/app_pref_helpers.dart';
import 'package:hungry_app/features/auth/views/sign_up_view.dart';
import 'package:hungry_app/root.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slideLogo;
  late Animation<Offset> _slideImage;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _startAppFlow();
  }

  void _initAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fade = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _slideLogo = Tween(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideImage = Tween(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _scale = Tween(
      begin: 0.85,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();
  }

  void _startAppFlow() async {
    await Future.delayed(const Duration(seconds: 2));

    final isLogged =
        AppPrefHelpers.loadData(AppPrefHelpers.usernameKey) != null;

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => isLogged ? const Root() : const SignUpView(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          const Gap(200),

          /// LOGO
          FadeTransition(
            opacity: _fade,
            child: SlideTransition(
              position: _slideLogo,
              child: ScaleTransition(
                scale: _scale,
                child: SvgPicture.asset("assets/logo/hungry.svg"),
              ),
            ),
          ),

          const Spacer(),

          /// IMAGE
          FadeTransition(
            opacity: _fade,
            child: SlideTransition(
              position: _slideImage,
              child: Image.asset("assets/splash/splash.png"),
            ),
          ),
        ],
      ),
    );
  }
}
