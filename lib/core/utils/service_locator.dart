import 'package:get_it/get_it.dart';
import 'package:hungry_app/core/network/api_services.dart';

final getIt = GetIt.instance ;
void setupServiceLocator(){
  getIt.registerSingleton<ApiServices>(ApiServices());
}