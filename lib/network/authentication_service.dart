import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:setting/network/api_service.dart';
import 'package:setting/network/data/app_auth.dart';
import 'package:setting/network/data/base_url.dart';
import 'package:setting/network/data/login_token.dart';

class AuthenticationService {
  static Future<LoginToken> signIn(
    String userName,
    String password,
    String authKey,
  ) async {
    Map<String, String> header = await ApiService.getHeader();

    final url = Uri.parse("${ApiService.baseUrl}/auth/sign-in");

    final response = await http.post(
      url,
      headers: header,
      body: jsonEncode({
        "username": userName,
        "password": password,
        "appauth": authKey,
      }),
    );

    if (response.statusCode == 200) {
      final Data data = Data.fromJson(jsonDecode(response.body));
      return LoginToken.fromJson(data.data);
    }

    throw Error();
  }

  static Future<AppAuth> appAuth(AppAuthKey key) async {
    Map<String, String> header = await ApiService.getHeader();

    final url = Uri.parse("${ApiService.baseUrl}/auth/app-auth");

    final response = await http.post(
      url,
      headers: header,
      body: jsonEncode({"appauthkey": key}),
    );

    if (response.statusCode == 200) {
      final Data data = Data.fromJson(jsonDecode(response.body));
      return AppAuth.fromJson(data.data);
    }

    throw Error();
  }

  static Future<void> singOut() async {
    Map<String, String> header = await ApiService.getHeader();

    final url = Uri.parse("${ApiService.baseUrl}/auth/signout");

    final response = await http.post(url, headers: header);

    if (response.statusCode == 200) {
      return;
    }

    // throw Error();   // Signout은 실패해도 무시
  }
}
