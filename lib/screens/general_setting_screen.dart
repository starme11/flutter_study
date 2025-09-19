import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting/l10n/app_localizations.dart';
import 'package:setting/theme_provider.dart';
import 'package:setting/widgets/custom_listview.dart';
import 'package:setting/widgets/tool_bar.dart';

class GeneralSettingScreen extends StatelessWidget {
  const GeneralSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final themeProvider = Provider.of<ThemeProvider>(context);

    final items = [
      localizations.day_night_time_setting,
      localizations.string_sound_and_vibrate,
      localizations.theme_setting,
      localizations.widget_setting_title,
      MapEntry(MapEntry(localizations.version_info_title, "0.0.0"), true),
      localizations.info_narsha,
    ];

    void onTapItem(String title) {
      print("onTap $title");
    }

    return Scaffold(
      appBar: ToolBar(
        title: localizations.general_setting_title,
        localizations: localizations,
        themeProvider: themeProvider,
        onHomePressed: () {
          print("onTapHomeButton");
        },
        visibleHome: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: CustomListview(items: items, onTapItem: onTapItem),
      ),
    );
  }
}
