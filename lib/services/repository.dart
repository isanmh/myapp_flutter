import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/models/user_model.dart';

class Repository {
  final _baseUrl = 'https://63dc8ab22308e3e319e95fa1.mockapi.io/users';

  // get all data from api
  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<User> users = it.map((e) => User.fromJson(e)).toList();
        return users;
      } else {
        print('Error');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
