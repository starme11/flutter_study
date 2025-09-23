import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:setting/network/api_service.dart';
import 'package:setting/network/data/base_url.dart';
import 'package:setting/network/data/user.dart';

class UserService {
  static Future<User> getUser(int id, dynamic include) async {
    Map<String, String> header = await ApiService.getHeader();

    final url = Uri.parse(
      "${ApiService.baseUrl}/users/$id${include == null ? "" : "?include=$include"}",
    );

    final response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      final Data data = Data.fromJson(jsonDecode(response.body));
      return User.fromJson(data.data);
    }

    throw Error();
  }
}
