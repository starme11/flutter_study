import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting/data/preference/app_preference.dart';
import 'package:setting/data/preference/emergency_setting.dart';
import 'package:setting/data/preference/user.dart';
import 'package:setting/l10n/app_localizations.dart';
import 'package:setting/theme_provider.dart';
import 'package:setting/widgets/tool_bar.dart';

class EmergencyViewScreen extends StatefulWidget {
  const EmergencyViewScreen({super.key});

  @override
  State<EmergencyViewScreen> createState() => _EmergencyViewScreenState();
}

class _EmergencyViewScreenState extends State<EmergencyViewScreen> {
  EmergencySetting setting = EmergencySetting(
    useEmergencyCard: false,
    contact: ["", "", ""],
  );
  User user = User();

  @override
  void initState() async {
    super.initState();

    setting = await AppPreference.getEmergencySetting();
    user = await AppPreference.getUser();

    setState(() {});
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
              setting.message ?? localizations.emergency_card_message,
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
                  user.displayName ?? "",
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
                  user.diabetesType ?? "",
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
                for (int i = 0; i < setting.contact.length; i++)
                  if (setting.contact[i] != "")
                    Text(
                      "${i + 1}. ${setting.contact[i]}",
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
                  setting.hospital ?? "",
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
