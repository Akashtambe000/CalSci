import 'package:flutter/material.dart';
import '../Methods/ScreenData.dart';

class Screen extends StatefulWidget {
  final ScreenData data1;
  final ScreenData data1b;
  final ScreenData data2;
  final ScreenData data2b;
  Screen(
      {Key key,
      @required this.data1,
      @required this.data1b,
      @required this.data2,
      @required this.data2b})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => ScreenState();
}

class ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: <Widget>[
          //SizedBox(height: constraints.maxHeight * 0.3),
          Container(
            height: constraints.maxHeight * 0.25,
            child: Text(
                "${widget.data1.getbuffer.replaceAll(new RegExp(r'-'), '–')}",
                textScaleFactor: 1.5,
                style: TextStyle(
                  color: Colors.white,
                )),
            alignment: Alignment.bottomRight,
          ),
          Container(
            height: constraints.maxHeight * 0.25,
            child: Text(
                "${widget.data1b.getbuffer.replaceAll(new RegExp(r'-'), '–')}",
                textScaleFactor: 1.5,
                style: TextStyle(
                  color: Colors.white,
                )),
            alignment: Alignment.bottomRight,
          ),
          Container(
            height: constraints.maxHeight * 0.25,
            child: Text("${widget.data2.getbuffer}",
                textScaleFactor: 2,
                style: TextStyle(
                  color: Colors.white,
                )),
            alignment: Alignment.bottomRight,
          ),
          Container(
            height: constraints.maxHeight * 0.25,
            child: Text("${widget.data2b.getbuffer}",
                textScaleFactor: 2,
                style: TextStyle(
                  color: Colors.white,
                )),
            alignment: Alignment.bottomRight,
          ),
        ],
      );
    });
  }
}
