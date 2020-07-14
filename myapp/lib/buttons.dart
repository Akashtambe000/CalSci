import 'package:flutter/material.dart';
import './buttonWidget.dart';

class Buttons extends StatelessWidget {
  final buttonlist = [
    [
      {"keyValue": "AC", "bgColor": Colors.red},
      {"keyValue": "<", "bgColor": Colors.red},
      {"keyValue": "%", "bgColor": Colors.blue},
      {"keyValue": "÷", "bgColor": Colors.blue},
    ],
    [
      {"keyValue": "7", "bgColor": Colors.grey},
      {"keyValue": "8", "bgColor": Colors.grey},
      {"keyValue": "9", "bgColor": Colors.grey},
      {"keyValue": "×", "bgColor": Colors.blue},
    ],
    [
      {"keyValue": "4", "bgColor": Colors.grey},
      {"keyValue": "5", "bgColor": Colors.grey},
      {"keyValue": "6", "bgColor": Colors.grey},
      {"keyValue": "-", "bgColor": Colors.blue},
    ],
    [
      {"keyValue": "1", "bgColor": Colors.grey},
      {"keyValue": "2", "bgColor": Colors.grey},
      {"keyValue": "3", "bgColor": Colors.grey},
      {"keyValue": "+", "bgColor": Colors.blue},
    ],
    [
      {"keyValue": "±", "bgColor": Colors.blue},
      {"keyValue": "0", "bgColor": Colors.grey},
      {"keyValue": ".", "bgColor": Colors.grey},
      {"keyValue": "=", "bgColor": Colors.green},
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
              padding: EdgeInsets.symmetric(vertical: 5),
              child: ButtonWidget(
                bgColor: singleButton["bgColor"],
                keyValue: singleButton["keyValue"],
              ),
            );
          }).toList());
        }).toList()),
      );
    });
  }
}
