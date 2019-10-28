import 'package:fnbees/services/serviceworkers.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:fnbees/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginModel extends Model {
  ServiceWorkers workers = locator<ServiceWorkers>();
  String title = 'FnBees Login';
  bool isLogin = true;
  String email;
  String password;
  String error = '';
  AuthResult authResult;

  bool checkStatus() {
    return isLogin;
  }

  Future<bool> doLogin() async {
    try {
      authResult = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      error = e.message;
      notifyListeners();
    }
    return false;
  }

  Future<bool> doSignUp() async {
    try {
      authResult = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      error = e.message;
      notifyListeners();
    }
    return false;
  }

  void showLogin() {
    isLogin = true;
    notifyListeners();
  }

  void showSignUp() {
    isLogin = false;
    notifyListeners();
  }
}
