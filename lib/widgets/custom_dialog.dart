import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:setting/widgets/button.dart';

class CustomDialog {
  // static void insulInAmountPicker(
  //   BuildContext context,
  //   String title,
  //   double min,
  //   double max,
  //   double current,
  //   String unit,
  //   String button,
  //   VoidCallback action,
  // ) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       double selectedValue = current;

  //       return Container(
  //         height: 360,
  //         padding: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
  //         child: Column(
  //           children: [
  //             SizedBox(
  //               height: 60,
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   const SizedBox(width: 40, height: 40),
  //                   Expanded(
  //                     child: Text(
  //                       title,
  //                       style: const TextStyle(
  //                         fontFamily: "NotoSansCJKKR",
  //                         fontWeight: FontWeight.w500,
  //                         fontSize: 18,
  //                         color: Color.fromRGBO(33, 33, 33, 1),
  //                       ),
  //                       textAlign: TextAlign.center,
  //                     ),
  //                   ),
  //                   GestureDetector(
  //                     onTap: () => Navigator.pop(context),
  //                     child: Image.asset("assets/images/btnNaviX.png"),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Expanded(
  //               child: Center(
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       unit,
  //                       style: const TextStyle(
  //                         fontSize: 24,
  //                         fontWeight: FontWeight.bold,
  //                         color: Colors.transparent,
  //                       ),
  //                     ),
  //                     const SizedBox(width: 10),
  //                     EditableDecimalNumberPicker(
  //                       min: min,
  //                       max: max,
  //                       current: current,
  //                       unit: unit,
  //                       onChanged: (val) {
  //                         selectedValue = val;
  //                       },
  //                     ),
  //                     const SizedBox(width: 10),
  //                     Text(unit, style: const TextStyle(fontSize: 24)),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             PrimaryPositiveButton(
  //               text: button,
  //               onTapEvent: () {
  //                 Navigator.pop(context);
  //                 action();
  //               },
  //               isEnabled: true,
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  static void insulInAmountPicker(
    BuildContext context,
    String title,
    double min,
    double max,
    double current,
    String unit,
    String button,
    VoidCallback action,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 360,
          padding: EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 15),
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(width: 40, height: 40),
                    ),
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontFamily: "NotoSansCJKKR",
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color.fromRGBO(33, 33, 33, 1),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset("assets/images/btnNaviX.png"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          unit,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.transparent,
                          ),
                        ),
                        const SizedBox(width: 10), // 피커와 'kg' 사이 간격
                        NumberPicker(
                          minValue: (min * 100).round(),
                          maxValue: (max * 100).round(),
                          step: 5,
                          value: (current * 100).round(),
                          onChanged: (value) => (),
                          textMapper: (text) {
                            return (int.parse(text) / 100).toStringAsFixed(2);
                          },
                          itemHeight: 60, // 피커 아이템의 높이를 설정하여 텍스트와 정렬
                          axis: Axis.vertical, // 수직 스크롤
                        ),
                        const SizedBox(width: 10), // 피커와 'kg' 사이 간격
                        Text(unit, style: TextStyle(fontSize: 24)),
                      ],
                    );
                  },
                ),
              ),
              PrimaryPositiveButton(
                text: button,
                onTapEvent: action,
                isEnabled: true,
              ),
            ],
          ),
        );
      },
    );
  }
}
