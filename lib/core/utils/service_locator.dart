import 'package:get_it/get_it.dart';
import 'package:hungry_app/core/network/api_services.dart';
import 'package:hungry_app/features/auth/data/repos/auth_repo_imp.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices());
  getIt.registerSingleton<AuthRepoImp>(
    AuthRepoImp(apiServices: getIt.get<ApiServices>()),
  );
}
