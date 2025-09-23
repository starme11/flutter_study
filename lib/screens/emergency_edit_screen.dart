import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting/data/preference/app_preference.dart';
import 'package:setting/data/preference/emergency_setting.dart';
import 'package:setting/l10n/app_localizations.dart';
import 'package:setting/screens/emergency_view_screen.dart';
import 'package:setting/widgets/tool_bar.dart';

import '../theme_provider.dart';

class EmergencyEditScreen extends StatefulWidget {
  const EmergencyEditScreen({super.key});

  @override
  State<EmergencyEditScreen> createState() => _EmergencyEditScreenState();
}

class _EmergencyEditScreenState extends State<EmergencyEditScreen> {
  EmergencySetting setting = EmergencySetting(
    useEmergencyCard: false,
    contact: ["", "", ""],
  );

  late TextEditingController _contact1TextController;
  late TextEditingController _contact2TextController;
  late TextEditingController _contact3TextController;
  late TextEditingController _hospitalNameTextController;
  late TextEditingController _hcpTextController;
  late TextEditingController _messageTextController;

  @override
  void initState() {
    super.initState();

    _contact1TextController = TextEditingController(text: " ");
    _contact2TextController = TextEditingController(text: " ");
    _contact3TextController = TextEditingController(text: " ");
    _hospitalNameTextController = TextEditingController(text: "");
    _hcpTextController = TextEditingController(text: "");
    _messageTextController = TextEditingController(text: "");

    AppPreference.getEmergencySetting().then((value) {
      setState(() {
        setting = value;
      });
    });
  }

  @override
  void dispose() async {
    super.dispose();

    _contact1TextController.dispose();
    _contact2TextController.dispose();
    _contact3TextController.dispose();
    _hospitalNameTextController.dispose();
    _hcpTextController.dispose();
    _messageTextController.dispose();

    setting.contact[0] = _contact1TextController.text;
    setting.contact[1] = _contact2TextController.text;
    setting.contact[2] = _contact3TextController.text;
    setting.hospital = _hospitalNameTextController.text;
    setting.doctor = _hcpTextController.text;
    setting.message = _messageTextController.text;

    AppPreference.savePreference(setting);
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final themeProvider = Provider.of<ThemeProvider>(context);
    _contact1TextController.text = setting.contact[0];
    _contact2TextController.text = setting.contact[1];
    _contact3TextController.text = setting.contact[2];

    _hospitalNameTextController.text = setting.hospital ?? "";
    _hcpTextController.text = setting.doctor ?? "";

    _messageTextController.text = setting.message ?? "";
    // channel_name_emergency
    return Scaffold(
      appBar: ToolBar(
        title: localizations.channel_name_emergency,
        localizations: localizations,
        themeProvider: themeProvider,
        onHomePressed: () {
          print("onTapHomeButton");
        },
        visibleHome: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 25,
            top: 0,
            right: 25,
            bottom: 20,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 35),
                Text(
                  localizations.emergency_contact,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 145, 234, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: "NotoSansCJKKR",
                  ),
                ),
                SizedBox(height: 7),
                Divider(
                  color: Provider.of<ThemeProvider>(context).isDarkMode()
                      ? Color.fromRGBO(0xe0, 0xe0, 0xe0, 1)
                      : Color.fromRGBO(0x61, 0x61, 0x61, 1),
                  thickness: 1,
                  height: 1,
                ),
                _contactTextField(_contact1TextController, 1),
                _contactTextField(_contact2TextController, 2),
                _contactTextField(_contact3TextController, 3),
                SizedBox(height: 35),
                Text(
                  localizations.hospital_info,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 145, 234, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: "NotoSansCJKKR",
                  ),
                ),
                SizedBox(height: 7),
                Divider(
                  color: Provider.of<ThemeProvider>(context).isDarkMode()
                      ? Color.fromRGBO(0xe0, 0xe0, 0xe0, 1)
                      : Color.fromRGBO(0x61, 0x61, 0x61, 1),
                  thickness: 1,
                  height: 1,
                ),
                SizedBox(height: 19),
                Text(
                  localizations.hospital_name,
                  style: TextStyle(
                    color: Color.fromRGBO(189, 189, 189, 1),
                    fontSize: 13,
                  ),
                ),
                TextFormField(
                  controller: _hospitalNameTextController,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    isDense: true,

                    contentPadding: EdgeInsets.only(left: 0, top: 2, bottom: 7),
                  ),
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(33, 33, 33, 1),
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (text) {},
                ),
                SizedBox(height: 19),
                Text(
                  localizations.hcp,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 145, 234, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: "NotoSansCJKKR",
                  ),
                ),
                SizedBox(height: 7),
                TextFormField(
                  controller: _hcpTextController,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    isDense: true,

                    contentPadding: EdgeInsets.only(left: 0, top: 2, bottom: 7),
                  ),
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(33, 33, 33, 1),
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (text) {},
                ),
                SizedBox(height: 35),
                Text(
                  localizations.message_contents,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 145, 234, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: "NotoSansCJKKR",
                  ),
                ),
                SizedBox(height: 7),
                Divider(
                  color: Provider.of<ThemeProvider>(context).isDarkMode()
                      ? Color.fromRGBO(0xe0, 0xe0, 0xe0, 1)
                      : Color.fromRGBO(0x61, 0x61, 0x61, 1),
                  thickness: 1,
                  height: 1,
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 100,
                  child: TextFormField(
                    maxLines: null,
                    maxLength: 135,
                    keyboardType: TextInputType.multiline,
                    expands: true,
                    controller: _messageTextController,
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      isDense: true,
                      contentPadding: EdgeInsets.only(
                        left: 0,
                        top: 2,
                        bottom: 7,
                      ),
                      counterText: "",
                    ),
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(33, 33, 33, 1),
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (text) {
                      _messageTextController.text = text;
                    },
                  ),
                ),
                SizedBox(height: 27),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Color.fromRGBO(0, 145, 234, 1),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Text(
                    localizations.button_preview,
                    style: TextStyle(
                      color: Color.fromRGBO(0, 145, 234, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "NotoSansCJKKR-Medium",
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmergencyViewScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(0, 145, 234, 1),
                    minimumSize: Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    localizations.save,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "NotoSansCJKKR-Medium",
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _contactTextField(TextEditingController controller, int number) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsetsGeometry.directional(top: 28, bottom: 7),
            child: TextField(
              controller: controller,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                prefixText: '$number.',
                prefixStyle: TextStyle(
                  color: Color.fromRGBO(33, 33, 33, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    print("onTap - 1");
                  },
                  child: Image.asset('assets/images/icon.png'),
                ),
              ),
              style: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(33, 33, 33, 1),
                fontWeight: FontWeight.bold,
              ),
              onChanged: (text) {},
            ),
          ),
        ),
      ],
    );
  }
}
