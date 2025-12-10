import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/utils/app_pref_helpers.dart';
import 'package:hungry_app/core/utils/service_locator.dart';
import 'package:hungry_app/features/auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:hungry_app/features/auth/data/repos/auth_repo_imp.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit(getIt.get<AuthRepoImp>())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}
