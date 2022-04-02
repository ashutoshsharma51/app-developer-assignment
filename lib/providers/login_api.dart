import 'package:app/helpers/shared_pref.dart';

class LoginApi {
  Future<void> loginUser(String username) async {
    await SharedPreferencesHelper().setLoggedInUser(username);
  }

  void logoutUser() {
    SharedPreferencesHelper().clearLoggedInUser();
  }
}
