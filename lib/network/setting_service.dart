import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:setting/network/api_service.dart';
import 'package:setting/network/data/base_url.dart';
import 'package:setting/network/data/user_setting.dart';

class SettingService {
  static Future<UserSetting> findOneSettings(int id) async {
    Map<String, String> header = await ApiService.getHeader();

    final url = Uri.parse("${ApiService.baseUrl}/settings/$id");

    final response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      final Data data = Data.fromJson(jsonDecode(response.body));
      return UserSetting.fromJson(data.data);
    } else if (response.statusCode == 404) {
      return UserSetting();
    }

    throw Error();
  }
}
