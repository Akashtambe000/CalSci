import 'package:flutter/material.dart';
import './buttonWidget.dart';

class Buttons extends StatelessWidget {
  final buttonlist = [
    [
      {"keyValue": "AC", "bgColor": Colors.teal},
      {"keyValue": "<", "bgColor": Colors.teal},
      {"keyValue": "%", "bgColor": Colors.amber},
      {"keyValue": "÷", "bgColor": Colors.amber},
    ],
    [
      {"keyValue": "7", "bgColor": Colors.white10},
      {"keyValue": "8", "bgColor": Colors.white10},
      {"keyValue": "9", "bgColor": Colors.white10},
      {"keyValue": "×", "bgColor": Colors.amber},
    ],
    [
      {"keyValue": "4", "bgColor": Colors.white10},
      {"keyValue": "5", "bgColor": Colors.white10},
      {"keyValue": "6", "bgColor": Colors.white10},
      {"keyValue": "-", "bgColor": Colors.amber},
    ],
    [
      {"keyValue": "1", "bgColor": Colors.white10},
      {"keyValue": "2", "bgColor": Colors.white10},
      {"keyValue": "3", "bgColor": Colors.white10},
      {"keyValue": "+", "bgColor": Colors.amber},
    ],
    [
      {"keyValue": "±", "bgColor": Colors.amber},
      {"keyValue": "0", "bgColor": Colors.white10},
      {"keyValue": ".", "bgColor": Colors.white10},
      {"keyValue": "=", "bgColor": Colors.teal},
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
                  ),
                );
              }).toList());
        }).toList()),
      );
    });
  }
}
