import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color bgColor;
  final String keyValue;

  ButtonWidget({@required this.bgColor, @required this.keyValue});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return RaisedButton(
        onPressed: ()=>{},
        shape: CircleBorder(),
        color: bgColor,
        child: Text(keyValue,textScaleFactor: 1.5,)
      );
    });
  }
}
