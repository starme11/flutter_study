import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:setting/data/preference/general_setting.dart';
import 'package:setting/data/preference/log_in_token.dart';
import 'package:setting/network/data/base_url.dart';
import 'package:setting/service/service_locator.dart';
import 'package:setting/utils/common_util.dart';

class ApiService {
  static const String baseUrl = "https://api-dev.eobridge.com";
  static String? oneTimeToken;

  static Future<Map<String, String>> getHeader() async {
    GeneralSetting gs = ServiceLocator.instance.appPreference
        .getGeneralSetting();
    LogInToken token = ServiceLocator.instance.appPreference.getLogInToken();

    Map<String, String> header = {};
    header["Accept"] = "application/json";
    header["Content-Type"] = "application/json";
    header["Accept-Language"] = PlatformDispatcher.instance.locale.languageCode;
    header["User-Agent"] = getUserAgent();
    header["X-Timezone-Offset"] = CommonUtil.getTimezoneOffset();

    header["x-request-id"] = gs.deviceId;
    if (oneTimeToken != null && oneTimeToken!.isNotEmpty) {
      header["Authorization"] = "Bearer $oneTimeToken";
      oneTimeToken = null;
    } else {
      if (token.token?.isNotEmpty == true) {
        header["Authorization"] = "Bearer ${token.token}";
      }
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

  static void setOneTimeToken(String? token) {
    oneTimeToken = token;
  }
}
