import 'package:firebase_auth/firebase_auth.dart';
import 'package:fnbees/services/serviceworkers.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:fnbees/service_locator.dart';

class HomeModel extends Model {
  ServiceWorkers workers = locator<ServiceWorkers>();
  String title = 'FnBees Home';
  bool isLogin = true;
  String email;
  String password;
  String error = '';
  AuthResult authResult;
}
