import 'package:setting/data/preference/app_preference.dart';
import 'package:setting/data/preference/preference.dart';

class GeneralSetting implements Preference {
  @override
  String PREFERENCE_NAME = "GENERAL_SETTING";

  // Generate a v8 (time-random) id
  String deviceId; //= Uuid().v8();
  String baseUrl;
  int lastLoginId = 0;
  String? lastLoginUsername;
  String? lastLoginUserRole;

  GeneralSetting({
    required this.deviceId,
    required this.baseUrl,
    required this.lastLoginId,
    required this.lastLoginUsername,
    required this.lastLoginUserRole,
  });

  factory GeneralSetting.fromJson(Map<String, dynamic> json) {
    return GeneralSetting(
      deviceId: json["deviceId"],
      baseUrl: json["baseUrl"],
      lastLoginId: json["lastLoginId"] ?? 0,
      lastLoginUsername: json["lastLoginUsername"],
      lastLoginUserRole: json["lastLoginUserRole"],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "deviceId": deviceId,
      "baseUrl": baseUrl,
      "lastLoginId": lastLoginId,
      "lastLoginUsername": lastLoginUsername,
      "lastLoginUserRole": lastLoginUserRole,
    };
  }

  @override
  void clear() {
    deviceId = "";
    baseUrl = "";
    lastLoginId = 0;
    lastLoginUsername = null;
    lastLoginUserRole = null;

    AppPreference.savePreference(this);
  }
}
