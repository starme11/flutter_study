import 'dart:convert';

import 'package:setting/data/preference/emergency_setting.dart';
import 'package:setting/data/preference/general_setting.dart';
import 'package:setting/data/preference/log_in_token.dart';
import 'package:setting/data/preference/preference.dart';
import 'package:setting/data/preference/sign_in_token.dart';
import 'package:setting/data/preference/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class AppPreference {
  late final SharedPreferences prefs;

  Future<SharedPreferences> initPreference() async {
    prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey("GENERAL_SETTING")) {
      GeneralSetting setting = GeneralSetting(
        deviceId: Uuid().v8(),
        baseUrl: "",
        lastLoginId: 0,
        lastLoginUsername: null,
        lastLoginUserRole: null,
      );
      prefs.setString("GENERAL_SETTING", jsonEncode(setting.toJson()));
    }

    if (!prefs.containsKey("EMERGENCY_SETTING")) {
      EmergencySetting setting = EmergencySetting(
        useEmergencyCard: false,
        contact: [" ", " ", " "],
        hospital: null,
        doctor: null,
        message: null,
      );
      prefs.setString("EMERGENCY_SETTING", jsonEncode(setting.toJson()));
    }

    if (!prefs.containsKey("USER")) {
      User user = User();
      prefs.setString("USER", jsonEncode(user.toJson()));
    }

    if (!prefs.containsKey("LOG_IN_TOKEN")) {
      LogInToken token = LogInToken(
        pid: 0,
        token: "",
        created: "",
        expired: "",
      );
      prefs.setString("LOG_IN_TOKEN", jsonEncode(token.toJson()));
    }

    if (!prefs.containsKey("SIGN_IN_TOKEN")) {
      SignInToken token = SignInToken(
        id: 0,
        status: 0,
        token: "",
        created: "",
        expired: "",
      );
      prefs.setString("SIGN_IN_TOKEN", jsonEncode(token.toJson()));
    }

    return prefs;
  }

  GeneralSetting getGeneralSetting() {
    String json = prefs.getString("GENERAL_SETTING") ?? "";

    return GeneralSetting.fromJson(jsonDecode(json));
  }

  // static void saveGeneralSetting(GeneralSetting setting) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   prefs.setString("GENERAL_SETTING", jsonEncode(setting.toJson()));
  // }

  EmergencySetting getEmergencySetting() {
    String json = prefs.getString("EMERGENCY_SETTING") ?? "";

    return EmergencySetting.fromJson(jsonDecode(json));
  }

  // void saveEmergencySetting(EmergencySetting setting) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   prefs.setString("EMERGENCY_SETTING", jsonEncode(setting.toJson()));
  // }

  User getUser() {
    String json = prefs.getString("USER") ?? "";

    return User.fromJson(jsonDecode(json));
  }

  // static void saveUser(User user) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   prefs.setString("USER", jsonEncode(user.toJson()));
  // }

  LogInToken getLogInToken() {
    String json = prefs.getString("LOG_IN_TOKEN") ?? "";

    return LogInToken.fromJson(jsonDecode(json));
  }

  SignInToken getSignInToken() {
    String json = prefs.getString("SIGN_IN_TOKEN") ?? "";

    return SignInToken.fromJson(jsonDecode(json));
  }

  void savePreference(Preference preference) {
    prefs.setString(
      preference.PREFERENCE_NAME,
      jsonEncode(preference.toJson()),
    );
  }
}
