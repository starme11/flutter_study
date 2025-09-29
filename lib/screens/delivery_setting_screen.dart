import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting/l10n/app_localizations.dart';
import 'package:setting/screens/bolus_preset_screen.dart';
import 'package:setting/theme_provider.dart';
import 'package:setting/widgets/custom_listview.dart';
import 'package:setting/widgets/tool_bar.dart';

class DeliverySettingScreen extends StatelessWidget {
  const DeliverySettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final themeProvider = Provider.of<ThemeProvider>(context);

    final items = [
      localizations.basal_program_management,
      localizations.temp_basal_preset_management,
      localizations.bolus_preset_management,
      localizations.carb_preset_management,
      localizations.bg_target_range,
      localizations.sound_and_vibrate,
      localizations.basal_temp_delivery,
      localizations.max_bolus_title,
      localizations.setting_bolus_calculator,
    ];

    void onTapItem(int index) {
      if (items[index] == localizations.bolus_preset_management) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BolusPresetScreen()),
        );
      }
    }

    return Scaffold(
      appBar: ToolBar(
        title: localizations.delivery_setting_title,
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
