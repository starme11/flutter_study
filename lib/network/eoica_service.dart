import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:setting/network/api_service.dart';
import 'package:setting/network/data/base_url.dart';
import 'package:setting/network/data/eoica.dart';

class EoicaService {
  static Future<Eoica> registerEoica(Eoica eoica) async {
    Map<String, String> header = await ApiService.getHeader();

    final url = Uri.parse("${ApiService.baseUrl}/eoica");

    final response = await http.post(
      url,
      headers: header,
      body: jsonEncode(eoica.toJson()),
    );

    if (response.statusCode == 200) {
      final Data data = Data.fromJson(jsonDecode(response.body));
      return Eoica.fromJson(data.data);
    }

    throw Error();
  }
}
