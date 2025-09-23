import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:setting/network/api_service.dart';
import 'package:setting/network/data/base_url.dart';
import 'package:setting/network/data/fcm.dart';

class FcmService {
  static Future<Fcm> forceRegisterFcm(Fcm fcm) async {
    Map<String, String> header = await ApiService.getHeader();

    final url = Uri.parse("${ApiService.baseUrl}/fcm/force");

    final response = await http.put(
      url,
      headers: header,
      body: jsonEncode(fcm.toJson()),
    );

    if (response.statusCode == 200) {
      final Data data = Data.fromJson(jsonDecode(response.body));
      return Fcm.fromJson(data.data);
    }

    throw Error();
  }
}
