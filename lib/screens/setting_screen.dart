import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting/l10n/app_localizations.dart';
import 'package:setting/screens/cs_screen.dart';
import 'package:setting/screens/delivery_setting_screen.dart';
import 'package:setting/screens/emergency_edit_screen.dart';
import 'package:setting/screens/general_setting_screen.dart';
import 'package:setting/theme_provider.dart';
import 'package:setting/widgets/custom_listview.dart';
import 'package:setting/widgets/tool_bar.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final themeProvider = Provider.of<ThemeProvider>(context);

    final items = [
      localizations.setting_privacy_security_title,
      localizations.setting_my_device_title,
      localizations.delivery_setting_title,
      localizations.alarm_alert_reminder,
      localizations.emergency,
      localizations.general_setting_title,
      localizations.cs,
    ];

    void onTapItem(int index) {
      final title = items[index];
      if (title == localizations.general_setting_title) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GeneralSettingScreen()),
        );
      } else if (title == localizations.cs) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CsScreen()),
        );
      } else if (title == localizations.emergency) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => EmergencyViewScreen()),
        // );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EmergencyEditScreen()),
        );
      } else if (title == localizations.delivery_setting_title) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DeliverySettingScreen()),
        );
      }
    }

    return Scaffold(
      appBar: ToolBar(
        title: localizations.title_setting,
        themeProvider: themeProvider,
        visibleHome: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: CustomListview(items: items, onTapItem: onTapItem),
      ),
    );
  }
}
