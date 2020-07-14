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
        elevation: 0,
        child: Text(keyValue,textScaleFactor: 2,style: TextStyle(color: Colors.white),)
      );
    });
  }
}
