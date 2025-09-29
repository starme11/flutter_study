import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting/app_constant.dart';
import 'package:setting/data/db/model/bolus_quick_delivery_preset.dart';
import 'package:setting/l10n/app_localizations.dart';
import 'package:setting/screens/bolus_preset_info_screen.dart';
import 'package:setting/service/service_locator.dart';
import 'package:setting/theme_provider.dart';
import 'package:setting/widgets/button.dart';
import 'package:setting/widgets/custom_listview.dart';
import 'package:setting/widgets/tool_bar.dart';

class BolusPresetScreen extends StatefulWidget {
  const BolusPresetScreen({super.key});

  @override
  State<BolusPresetScreen> createState() => _BolusPresetScreenState();
}

class _BolusPresetScreenState extends State<BolusPresetScreen> {
  final repository = ServiceLocator.instance.bolusQuickDeliveryPresetRepository;
  late List<BolusQuickDeliveryPreset> items;

  void _loadPreset() {
    items = repository.getAll();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _loadPreset();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final themeProvider = Provider.of<ThemeProvider>(context);

    repository.count();

    void onTapItem(int index) {
      final preset = items[index];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              BolusPresetInfoScreen(no: preset.no, isEditable: false),
        ),
      );
    }

    void onTapMoreMenu(MapEntry<dynamic, dynamic> entry) async {
      final preset = items[entry.key as int];

      if (entry.value == localizations.edit) {
        final result = await Navigator.push<bool>(
          context,
          MaterialPageRoute(
            builder: (context) =>
                BolusPresetInfoScreen(no: preset.no, isEditable: true),
          ),
        );

        if (result == true) {
          _loadPreset();
        }
      } else if (entry.value == localizations.delete) {
        // repository.delete(preset.no);
        // _loadPreset();
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            final AppLocalizations localizations = AppLocalizations.of(
              context,
            )!;
            return Container(
              height: 300,
              padding: const EdgeInsets.all(16.0),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 60,
                      child: Text(
                        localizations.delete,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(33, 33, 33, 1),
                        ),
                      ),
                    ),
                    Text(
                      localizations.delete_preset(preset.name),
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(33, 33, 33, 1),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SecondaryPositiveButton(
                            text: localizations.cancel,
                            onTapEvent: () => Navigator.pop(context),
                            isEnabled: true,
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: PrimaryPositiveButton(
                            text: localizations.delete,
                            onTapEvent: () {
                              Navigator.pop(context);
                              repository.delete(preset.no);
                              _loadPreset();
                            },
                            isEnabled: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: ToolBar(
        title: localizations.bolus_preset_management,
        themeProvider: themeProvider,
        visibleHome: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: repository.count() == 0
                  ? Center(
                      child: Text(
                        localizations.no_bolus_preset,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "NotoSansCJKKR",
                          color: Color.fromRGBO(33, 33, 33, 1),
                        ),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      child: CustomListview(
                        items: items,
                        onTapItem: onTapItem,
                        onTapMoreMenu: onTapMoreMenu,
                      ),
                    ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
              child: PrimaryPositiveButton(
                text: localizations.add_new,
                onTapEvent: () => onTapAddButton(context),
                isEnabled:
                    repository.count() <
                    AppConstant.BOLUS_PRESET_MAX_PRESET_SIZE,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTapAddButton(BuildContext context) async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => BolusPresetInfoScreen(no: 0, isEditable: true),
      ),
    );

    if (result == true) {
      _loadPreset();
    }
  }
}
