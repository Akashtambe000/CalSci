import 'package:flutter/material.dart';
import './buttonWidget.dart';
import '../Methods/ScreenData.dart';

class Buttons extends StatelessWidget {
  Buttons({@required this.bufferUpdated});

  final Function bufferUpdated;

  static void addToBuffer(ButtonWidget b) {
    buffer.add(b.keyValue);
  }

  static void clearBuffer(ButtonWidget b) {
    buffer.clear();
  }

  static void backspace(ButtonWidget b) {
    buffer.remove();
  }

  final buttonlist = [
    [
      {"keyValue": "AC", "bgColor": Colors.teal, "func": clearBuffer},
      {"keyValue": "<", "bgColor": Colors.teal, "func": backspace},
      {"keyValue": "%", "bgColor": Colors.amber, "func": addToBuffer},
      {"keyValue": "÷", "bgColor": Colors.amber, "func": addToBuffer},
    ],
    [
      {"keyValue": "7", "bgColor": Colors.white10, "func": addToBuffer},
      {"keyValue": "8", "bgColor": Colors.white10, "func": addToBuffer},
      {"keyValue": "9", "bgColor": Colors.white10, "func": addToBuffer},
      {"keyValue": "×", "bgColor": Colors.amber, "func": addToBuffer},
    ],
    [
      {"keyValue": "4", "bgColor": Colors.white10, "func": addToBuffer},
      {"keyValue": "5", "bgColor": Colors.white10, "func": addToBuffer},
      {"keyValue": "6", "bgColor": Colors.white10, "func": addToBuffer},
      {"keyValue": "-", "bgColor": Colors.amber, "func": addToBuffer},
    ],
    [
      {"keyValue": "1", "bgColor": Colors.white10, "func": addToBuffer},
      {"keyValue": "2", "bgColor": Colors.white10, "func": addToBuffer},
      {"keyValue": "3", "bgColor": Colors.white10, "func": addToBuffer},
      {"keyValue": "+", "bgColor": Colors.amber, "func": addToBuffer},
    ],
    [
      {"keyValue": "±", "bgColor": Colors.amber, "func": addToBuffer},
      {"keyValue": "0", "bgColor": Colors.white10, "func": addToBuffer},
      {"keyValue": ".", "bgColor": Colors.white10, "func": addToBuffer},
      {"keyValue": "=", "bgColor": Colors.teal, "func": addToBuffer},
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Container(
        child: Column(
            children: buttonlist.map((row) {
          return Row(
              children: row.map((singleButton) {
            return Container(
              width: constraints.maxWidth * 0.25,
              height: constraints.maxHeight * 0.20,
              padding: EdgeInsets.symmetric(vertical: 3),
              child: ButtonWidget(
                  bgColor: singleButton["bgColor"],
                  keyValue: singleButton["keyValue"],
                  keyFunction: singleButton["func"],
                  bufferUpdated: bufferUpdated),
            );
          }).toList());
        }).toList()),
      );
    });
  }
}
