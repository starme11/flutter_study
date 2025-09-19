import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting/data/preference/emergency_setting.dart';
import 'package:setting/data/preference/user.dart';
import 'package:setting/l10n/app_localizations.dart';
import 'package:setting/theme_provider.dart';
import 'package:setting/widgets/tool_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmergencyViewScreen extends StatefulWidget {
  const EmergencyViewScreen({super.key});

  @override
  State<EmergencyViewScreen> createState() => _EmergencyViewScreenState();
}

class _EmergencyViewScreenState extends State<EmergencyViewScreen> {
  late SharedPreferences prefs;
  EmergencySetting? setting;
  User? user;

  Future initPreference() async {
    // final AppLocalizations localizations = AppLocalizations.of(context)!;
    prefs = await SharedPreferences.getInstance();

    final settingJson = prefs.getString("EMERGENCY_SETTING");
    if (settingJson != null) {
      Map<String, dynamic> obj = jsonDecode(settingJson);
      setState(() {
        setting = EmergencySetting.fromJson(obj);
      });
      print("useEmergencyCard :: ${setting?.useEmergencyCard}");
      print("contact :: ${setting?.contact}");
      print("hospital :: ${setting?.hospital}");
      print("doctor :: ${setting?.doctor}");
      print("message :: ${setting?.message}");
    } else {
      setState(() {
        setting = EmergencySetting(
          useEmergencyCard: false,
          contact: ["111", "222", "333"],
          hospital: "분당 서울대학교 병원 의료진 홍길동",
          doctor: null,
          message: null,
        );
      });

      String jsonString = jsonEncode(setting?.toJson());

      await prefs.setString("EMERGENCY_SETTING", jsonString);
    }

    final userJson = prefs.getString("USER");

    if (userJson != null) {
      Map<String, dynamic> obj = jsonDecode(userJson);
      setState(() {
        user = User.fromJson(obj);
      });
      print("id :: ${user?.id}");
      print("status :: ${user?.status}");
      print("firstName :: ${user?.firstName}");
      print("lastName :: ${user?.lastName}");
      print("userName :: ${user?.userName}");
      print("displayName :: ${user?.displayName}");
      print("diabetesType :: ${user?.diabetesType}");
    } else {
      setState(() {
        user = User(
          id: 0,
          status: 0,
          firstName: "first",
          lastName: "last",
          userName: "user",
          displayName: "display",
          diabetesType: "diabetesType",
        );
      });

      // print("displayName :: ${user?.displayName}");

      String jsonString = jsonEncode(user?.toJson());

      await prefs.setString("USER", jsonString);
    }
  }

  @override
  void initState() {
    super.initState();

    initPreference();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: ToolBar(
        title: localizations.emergency,
        localizations: localizations,
        themeProvider: themeProvider,
        onHomePressed: () {
          print("onTapHomeButton");
        },
        visibleHome: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Image.asset('assets/images/img_emergency.png'),
          SizedBox(height: 21),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Color.fromRGBO(225, 245, 254, 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              setting?.message ?? localizations.emergency_card_message,
              style: TextStyle(
                fontFamily: "NotoSansCJKKR",
                fontSize: 15,
                color: Color.fromRGBO(33, 33, 33, 1),
              ),
              softWrap: true,
            ),
          ),
          SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localizations.string_name,
                  style: TextStyle(
                    fontFamily: "NotoSansCJKKR",
                    fontSize: 20,
                    color: Color.fromRGBO(158, 158, 158, 1),
                  ),
                ),
                Text(
                  user?.displayName ?? "",
                  style: TextStyle(
                    fontFamily: "NotoSansCJKKR",
                    fontSize: 16,
                    color: Color.fromRGBO(33, 33, 33, 1),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  localizations.profile_info_type_diabetes_hint,
                  style: TextStyle(
                    fontFamily: "NotoSansCJKKR",
                    fontSize: 20,
                    color: Color.fromRGBO(158, 158, 158, 1),
                  ),
                ),
                Text(
                  user?.diabetesType ?? "",
                  style: TextStyle(
                    fontFamily: "NotoSansCJKKR",
                    fontSize: 16,
                    color: Color.fromRGBO(33, 33, 33, 1),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  localizations.emergency_contact,
                  style: TextStyle(
                    fontFamily: "NotoSansCJKKR",
                    fontSize: 20,
                    color: Color.fromRGBO(158, 158, 158, 1),
                  ),
                ),
                if (setting != null)
                  for (int i = 0; i < setting!.contact.length; i++)
                    if (setting!.contact[i] != "")
                      Text(
                        "${i + 1}. ${setting!.contact[i]}",
                        style: TextStyle(
                          fontFamily: "NotoSansCJKKR",
                          fontSize: 16,
                          color: Color.fromRGBO(33, 33, 33, 1),
                        ),
                      ),
                SizedBox(height: 8),
                Text(
                  localizations.hospital_info,
                  style: TextStyle(
                    fontFamily: "NotoSansCJKKR",
                    fontSize: 20,
                    color: Color.fromRGBO(158, 158, 158, 1),
                  ),
                ),
                Text(
                  setting?.hospital ?? "",
                  style: TextStyle(
                    fontFamily: "NotoSansCJKKR",
                    fontSize: 16,
                    color: Color.fromRGBO(33, 33, 33, 1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
