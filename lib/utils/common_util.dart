import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class CommonUtil {
  static String? getAddress(String language) {
    String addressArray = FirebaseRemoteConfig.instance.getString("address");
    List<dynamic> jsonArray = jsonDecode(addressArray);

    for (Map<String, dynamic> json in jsonArray) {
      if (json["locale"] == language) {
        return json["address"].replaceAll('\\n', '\n');
      }
    }

    return null;
  }

  static String getTimezoneOffset() {
    DateTime now = DateTime.now();
    Duration offset = now.timeZoneOffset;

    return offset.isNegative ? "${offset.inMinutes}" : "-${offset.inMinutes}";
  }

  static String getHashKey() {
    return "al/naiH9Slf0RQHxU6tI3jA/MHI=";
  }
}
