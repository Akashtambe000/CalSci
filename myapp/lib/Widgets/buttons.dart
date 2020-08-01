import 'package:flutter/material.dart';
import './buttonWidget.dart';
import '../Methods/ScreenData.dart';
import '../Methods/Node.dart';
import '../Methods/InfixToPostfix.dart';

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

  static void displayResult(ButtonWidget b) {
    Tokenizer tk = Tokenizer(buffer.getbuffer);
    List<Node> infixNodeList = tk.getInfixNodeList();
    IToP itop = IToP(infixNodeList);
    List<Node> postfixNodeList = itop.convert();
    for (int i = 0; i < postfixNodeList.length; i++) {
      print(postfixNodeList[i].value);
    }
    // call infixTopostFix
    // call postfixEvaluation
    // store the result in buffer
  }

  final buttonlist = [
    [
      {"keyValue": "<", "bgColor": Colors.grey, "func": backspace},
      {"keyValue": "(", "bgColor": Colors.grey, "func": addToBuffer},
      {"keyValue": ")", "bgColor": Colors.grey, "func": addToBuffer},
      {"keyValue": "÷", "bgColor": Colors.orange, "func": addToBuffer},
    ],
    [
      {"keyValue": "7", "bgColor": Colors.white10, "func": addToBuffer},
      {"keyValue": "8", "bgColor": Colors.white10, "func": addToBuffer},
      {"keyValue": "9", "bgColor": Colors.white10, "func": addToBuffer},
      {"keyValue": "×", "bgColor": Colors.orange, "func": addToBuffer},
    ],
    [
      {"keyValue": "4", "bgColor": Colors.white10, "func": addToBuffer},
      {"keyValue": "5", "bgColor": Colors.white10, "func": addToBuffer},
      {"keyValue": "6", "bgColor": Colors.white10, "func": addToBuffer},
      {"keyValue": "-", "bgColor": Colors.orange, "func": addToBuffer},
    ],
    [
      {"keyValue": "1", "bgColor": Colors.white10, "func": addToBuffer},
      {"keyValue": "2", "bgColor": Colors.white10, "func": addToBuffer},
      {"keyValue": "3", "bgColor": Colors.white10, "func": addToBuffer},
      {"keyValue": "+", "bgColor": Colors.orange, "func": addToBuffer},
    ],
    [
      {"keyValue": "AC", "bgColor": Colors.grey, "func": clearBuffer},
      {"keyValue": "0", "bgColor": Colors.white10, "func": addToBuffer},
      {"keyValue": ".", "bgColor": Colors.white10, "func": addToBuffer},
      {"keyValue": "=", "bgColor": Colors.grey, "func": displayResult},
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
