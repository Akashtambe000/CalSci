import 'package:flutter/material.dart';
import './buttonWidget.dart';
import '../Methods/ScreenData.dart';
import '../Methods/Node.dart';
import '../Methods/InfixToPostfix.dart';

class Buttons extends StatelessWidget {
  Buttons({@required this.bufferUpdated});

  final Function bufferUpdated;

  static void addToBuffer(String keyValue, Type type) {
    exprTree.add(Node(value: keyValue, type: type));
    buffer.add(keyValue);
    calculate("_");
  }

  static void clearBuffer(String keyValue, Type type) {
    exprTree.root = null;
    buffer.clear();
    results.clear();
  }

  static void backspace(String keyValue, Type type) {
    exprTree.backspace();
    buffer.remove();
  }

  static void displayResult(String keyValue, Type type) {
    exprTree.root = null;
    calculate("_");
    buffer.clear();
  }

  static void calculate(String keyValue) {
    Tokenizer tk = Tokenizer(buffer.getbuffer);
    List<Node> infixNodeList = tk.getInfixNodeList();
    IToP itop = IToP(infixNodeList);
    itop.convert();
    results.buffer = evaluatePostfix(itop.getPostfix);
  }

  final buttonlist = [
    [
      {
        "keyValue": "<",
        "type": Type.Operator,
        "bgColor": Colors.grey,
        "func": backspace
      },
      {
        "keyValue": "(",
        "type": Type.Operator,
        "bgColor": Colors.grey,
        "func": addToBuffer
      },
      {
        "keyValue": ")",
        "type": Type.Operator,
        "bgColor": Colors.grey,
        "func": addToBuffer
      },
      {
        "keyValue": "÷",
        "type": Type.Operator,
        "bgColor": Colors.orange,
        "func": addToBuffer
      },
    ],
    [
      {
        "keyValue": "7",
        "type": Type.Number,
        "bgColor": Colors.white10,
        "func": addToBuffer
      },
      {
        "keyValue": "8",
        "type": Type.Number,
        "bgColor": Colors.white10,
        "func": addToBuffer
      },
      {
        "keyValue": "9",
        "type": Type.Number,
        "bgColor": Colors.white10,
        "func": addToBuffer
      },
      {
        "keyValue": "×",
        "type": Type.Operator,
        "bgColor": Colors.orange,
        "func": addToBuffer
      },
    ],
    [
      {
        "keyValue": "4",
        "type": Type.Number,
        "bgColor": Colors.white10,
        "func": addToBuffer
      },
      {
        "keyValue": "5",
        "type": Type.Number,
        "bgColor": Colors.white10,
        "func": addToBuffer
      },
      {
        "keyValue": "6",
        "type": Type.Number,
        "bgColor": Colors.white10,
        "func": addToBuffer
      },
      {
        "keyValue": "–",
        "type": Type.Operator,
        "bgColor": Colors.orange,
        "func": addToBuffer
      },
    ],
    [
      {
        "keyValue": "1",
        "type": Type.Number,
        "bgColor": Colors.white10,
        "func": addToBuffer
      },
      {
        "keyValue": "2",
        "type": Type.Number,
        "bgColor": Colors.white10,
        "func": addToBuffer
      },
      {
        "keyValue": "3",
        "type": Type.Number,
        "bgColor": Colors.white10,
        "func": addToBuffer
      },
      {
        "keyValue": "+",
        "type": Type.Operator,
        "bgColor": Colors.orange,
        "func": addToBuffer
      },
    ],
    [
      {
        "keyValue": "AC",
        "type": Type.Operator,
        "bgColor": Colors.grey,
        "func": clearBuffer
      },
      {
        "keyValue": "0",
        "type": Type.Number,
        "bgColor": Colors.white10,
        "func": addToBuffer
      },
      {
        "keyValue": ".",
        "type": Type.Number,
        "bgColor": Colors.white10,
        "func": addToBuffer
      },
      {
        "keyValue": "=",
        "type": Type.Operator,
        "bgColor": Colors.grey,
        "func": displayResult
      },
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
                  type: singleButton["type"],
                  keyFunction: singleButton["func"],
                  bufferUpdated: bufferUpdated),
            );
          }).toList());
        }).toList()),
      );
    });
  }
}
