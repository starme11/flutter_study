import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:setting/data/preference/general_setting.dart';
import 'package:setting/network/data/base_url.dart';
import 'package:setting/utils/common_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = "https://api-dev.eobridge.com";

  static Future<Map<String, String>> getHeader() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? generalSetting = prefs.getString("GENERAL_SETTING");

    Map<String, String> header = {};
    header["Accept"] = "application/json";
    header["Content-Type"] = "application/json";
    header["Accept-Language"] = PlatformDispatcher.instance.locale.languageCode;
    header["User-Agent"] = getUserAgent();
    header["X-Timezone-Offset"] = CommonUtil.getTimezoneOffset();

    if (generalSetting != null) {
      GeneralSetting setting = GeneralSetting.fromJson(
        jsonDecode(generalSetting),
      );
      header["x-request-id"] = setting.deviceId;
    }

    return header;
  }

  static String getUserAgent() {
    String appVersion = "1.0.0";
    String osVersion = "16.0";
    String manufacturer = "Apple";
    String model = "iPhone 16 Plus";
    String country = "KR";
    String feature = "BASE";

    return "EOMAPP($country,$feature)/$appVersion Android/$osVersion ($manufacturer, $model)";
  }

  static Future<BaseUrl> getServiceUrl() async {
    final url = Uri.parse("$baseUrl/init-srv");

    final response = await http.get(url, headers: await getHeader());

    if (response.statusCode == 200) {
      final Data data = Data.fromJson(jsonDecode(response.body));
      return BaseUrl.fromJson(data.data);
    }

    throw Error();
  }
}
