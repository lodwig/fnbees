import 'package:fnbees/models/login_model.dart';
import 'package:fnbees/services/serviceworkers.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Registering Services
  locator.registerLazySingleton<ServiceWorkers>(() => ServiceWorkers());
  // Registering All Models
  locator.registerFactory<LoginModel>(() => LoginModel());
}
