import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/app_pref_helpers.dart';
import 'package:hungry_app/core/utils/service_locator.dart';
import 'package:hungry_app/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppPrefHelpers.init();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}

