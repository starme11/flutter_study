import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting/app_constant.dart';
import 'package:setting/data/db/model/bolus_quick_delivery_preset.dart';
import 'package:setting/l10n/app_localizations.dart';
import 'package:setting/service/service_locator.dart';
import 'package:setting/theme_provider.dart';
import 'package:setting/widgets/button.dart';
import 'package:setting/widgets/custom_dialog.dart';
import 'package:setting/widgets/tool_bar.dart';

class BolusPresetInfoScreen extends StatefulWidget {
  const BolusPresetInfoScreen({
    super.key,
    required this.no,
    required this.isEditable,
  });

  final int no;
  final bool isEditable;

  @override
  State<BolusPresetInfoScreen> createState() => _BolusPresetInfoScreenState();
}

class _BolusPresetInfoScreenState extends State<BolusPresetInfoScreen> {
  late BolusQuickDeliveryPreset preset;
  late TextEditingController nameTextController;

  @override
  void initState() {
    super.initState();
    nameTextController = TextEditingController(text: "");

    if (widget.no == 0) {
      preset = BolusQuickDeliveryPreset(name: "", doseU: 0.15);
    } else {
      preset =
          ServiceLocator.instance.repositoryManager.bolusPresetRepository
              .getById(widget.no) ??
          BolusQuickDeliveryPreset(name: "", doseU: 0);
    }
    if (widget.isEditable) {
      nameTextController.text = preset.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final themeProvider = Provider.of<ThemeProvider>(context);

    if (widget.isEditable && preset.name.isEmpty) {
      preset.name = _findNewBolusName(localizations);
      nameTextController.text = preset.name;
      setState(() {});
    }
    return Scaffold(
      appBar: preset.no > 0
          ? ToolBar(title: preset.name, themeProvider: themeProvider)
          : null,
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 25, vertical: 14),
        child: widget.isEditable
            ? EditablePreset(
                nameTextController: nameTextController,
                preset: preset,
              )
            : NonEditablePreset(preset: preset),
      ),
    );
  }

  String _findNewBolusName(AppLocalizations localizations) {
    final repository =
        ServiceLocator.instance.bolusQuickDeliveryPresetRepository;
    if (repository.count() == 0) {
      return "${localizations.bolus} 1";
    } else {
      List names = repository
          .getAll()
          .map((item) => item.name.trim().toLowerCase())
          .toList();
      for (int i = 1; i <= AppConstant.BOLUS_PRESET_MAX_PRESET_SIZE; i++) {
        String name = "${localizations.bolus} $i";
        if (!names.contains(name.trim().toLowerCase())) {
          return name;
        }
      }
      return "";
    }
  }
}

class EditablePreset extends StatefulWidget {
  const EditablePreset({
    super.key,
    required this.nameTextController,
    required this.preset,
  });

  final TextEditingController nameTextController;
  final BolusQuickDeliveryPreset preset;

  @override
  State<EditablePreset> createState() => _EditablePresetState();
}

class _EditablePresetState extends State<EditablePreset> {
  void _showDecimalNumberPicker(BuildContext context) {
    // // 현재 값을 저장하는 변수. 5는 0.05를 의미.
    // int currentValue = 5;

    // showModalBottomSheet(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return Container(
    //       height: 300, // 바텀 시트의 높이
    //       padding: const EdgeInsets.all(16.0),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           const Text(
    //             '무게 선택 (kg)',
    //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //           ),
    //           const SizedBox(height: 20),
    //           StatefulBuilder(
    //             builder: (BuildContext context, StateSetter setState) {
    //               return Row(
    //                 mainAxisAlignment:
    //                     MainAxisAlignment.center, // Row의 내용을 중앙에 정렬
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   const Text(
    //                     'kg',
    //                     style: TextStyle(
    //                       fontSize: 24,
    //                       fontWeight: FontWeight.bold,
    //                       color: Colors.transparent,
    //                     ),
    //                   ),
    //                   const SizedBox(width: 10), // 피커와 'kg' 사이 간격
    //                   NumberPicker(
    //                     minValue: 5,
    //                     maxValue: 1000,
    //                     step: 5,
    //                     value: 5,
    //                     onChanged: (value) => (),
    //                     textMapper: (text) {
    //                       return (int.parse(text) / 100).toStringAsFixed(2);
    //                     },
    //                     itemHeight: 40, // 피커 아이템의 높이를 설정하여 텍스트와 정렬
    //                     axis: Axis.vertical, // 수직 스크롤
    //                   ),
    //                   const SizedBox(width: 10), // 피커와 'kg' 사이 간격
    //                   const Text(
    //                     'kg',
    //                     style: TextStyle(
    //                       fontSize: 24,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                 ],
    //               );
    //             },
    //           ),
    //           const SizedBox(height: 20),
    //           ElevatedButton(
    //             onPressed: () {
    //               // 사용자가 선택한 값을 콘솔에 출력 (예시)
    //               print('선택된 값: ${(currentValue / 100).toStringAsFixed(2)} kg');
    //               // 바텀 시트 닫기
    //               Navigator.pop(context);
    //             },
    //             child: const Text('확인'),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );

    CustomDialog.insulInAmountPicker(
      context,
      AppLocalizations.of(context)!.dialog_title_insulin,
      0.05,
      10,
      0.15,
      "U",
      AppLocalizations.of(context)!.confirm,
      () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final repository =
        ServiceLocator.instance.bolusQuickDeliveryPresetRepository;
    final localizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: widget.nameTextController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsetsGeometry.directional(
                          start: 16,
                          end: 6,
                          top: 8,
                          bottom: 9,
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(245, 245, 245, 1),
                      ),
                      style: TextStyle(
                        color: Color.fromRGBO(33, 33, 33, 1),
                        fontSize: 16,
                        fontFamily: "NotoSansCJKKR",
                      ),
                      onChanged: (value) {
                        widget.preset.name = value;
                      },
                    ),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset("assets/images/group.png"),
                  ),
                ],
              ),
              SizedBox(height: 22),
              Text(
                localizations.insulin,
                style: TextStyle(
                  color: Color.fromRGBO(33, 33, 33, 1),
                  fontSize: 16,
                  fontFamily: "NotoSansCJKKR",
                ),
              ),
              SizedBox(height: 8),
              GestureDetector(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(245, 245, 245, 1), // 연한 회색 배경
                    borderRadius: BorderRadius.circular(6), // 둥근 모서리
                  ),
                  padding: EdgeInsetsGeometry.directional(
                    start: 16,
                    end: 6,
                    top: 8,
                    bottom: 9,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.preset.doseU == 0
                            ? "--.--"
                            : "${widget.preset.doseU}",
                        style: TextStyle(
                          color: Color.fromRGBO(33, 33, 33, 1),
                          fontSize: 20,
                          fontFamily: "NotoSansCJKKR",
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "U",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "NotoSansCJKKR",
                          color: Color.fromRGBO(189, 189, 189, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  _showDecimalNumberPicker(context);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SecondaryPositiveButton(
                  text: localizations.cancel,
                  onTapEvent: () => Navigator.pop(context, false),
                  isEnabled: true,
                ),
              ),
              SizedBox(width: 7),
              Expanded(
                child: PrimaryPositiveButton(
                  text: localizations.save,
                  onTapEvent: () {
                    if (widget.preset.no == 0) {
                      repository.create(widget.preset);
                    } else {
                      repository.update(widget.preset);
                    }
                    Navigator.pop(context, true);
                  },
                  isEnabled: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NonEditablePreset extends StatelessWidget {
  const NonEditablePreset({super.key, required this.preset});

  final BolusQuickDeliveryPreset preset;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
