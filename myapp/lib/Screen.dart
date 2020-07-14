import 'package:flutter/material.dart';

class ScreenData {
  String buffer;

  ScreenData({this.buffer});

  void add(String value) {
    buffer += value;
  }

  void remove({int n = 1}) {
    buffer = buffer.substring(0, buffer.length - n);
  }

  void clear() {
    buffer = "";
  }

  @override
  String toString() {
    return buffer.toString();
  }
}

class Screen extends StatefulWidget {
  final ScreenData data;
  Screen({Key key, this.data}) : super(key: key);
  @override
  State<StatefulWidget> createState() => ScreenState();
}

class ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: <Widget>[
          SizedBox(height: constraints.maxHeight * 0.3),
          Container(
            height: constraints.maxHeight * 0.25,
            color: Colors.blue,
            child: Text(""),
            alignment: Alignment.bottomRight,
          ),
          Container(
            height: constraints.maxHeight * 0.25,
            color: Colors.deepOrangeAccent,
            child: Text(""),
            alignment: Alignment.bottomRight,
          ),
        ],
      );
    });
  }
}
