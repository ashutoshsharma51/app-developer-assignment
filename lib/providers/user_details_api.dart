import 'dart:convert';

import 'package:app/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserDetailsApi {
  Future<UserModel?> fetchUserByUsername(String? username) async {
    UserModel? _userModel;
    final fetchUserUrl =
        'https://bfa95c50-f408-49f2-a3d2-e1295166248a.mock.pstmn.io/fetchUser?username=' +
            username.toString();

    final response = await http.get(Uri.parse(fetchUserUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['user_data'];
      _userModel = new UserModel.fromJson(jsonData);
    }
    return _userModel;
  }
}
