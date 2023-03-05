import 'package:flutter_bloc_api_test/model/user_model.dart';
import 'package:http/http.dart' as http;

class APIServices {
  Future<List<UserModel>?> getUserData() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      return userModelFromJson(response.body);
    }
  }
}
