import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final loggedInUserKey = "LoggedInUser";
  Future<bool> setLoggedInUser(String username) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.setString(loggedInUserKey, username);
  }

  Future<String?> getLoggedInUser() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString(loggedInUserKey);
  }

  void clearLoggedInUser() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.remove(loggedInUserKey);
  }
}
