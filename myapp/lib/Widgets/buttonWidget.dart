import 'package:flutter/material.dart';
import '../Methods/ScreenData.dart';

class ButtonWidget extends StatelessWidget {
  final Color bgColor;
  final String keyValue;
  final Function keyFunction;
  final Function bufferUpdated;

  ButtonWidget(
      {@required this.bgColor,
      @required this.keyValue,
      @required this.keyFunction,
      @required this.bufferUpdated});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return RaisedButton(
          onPressed: () {
            List operators = ['+', '–', '×', '÷', '('];
            if (this.keyValue == "–" && operators.contains(buffer.buffer[buffer.buffer.length - 1]))
              keyFunction("-");
            else
              keyFunction(this.keyValue);  
            bufferUpdated();
          },
          shape: CircleBorder(),
          color: bgColor,
          elevation: 0,
          child: Text(
            keyValue,
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ));
    });
  }
}
