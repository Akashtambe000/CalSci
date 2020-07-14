import 'package:flutter/material.dart';
import '../Methods/ScreenData.dart';

class Screen extends StatefulWidget {
  final ScreenData data;
  Screen({Key key, @required this.data}) : super(key: key);
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
            //color: Colors.blue,
            child: Text("${widget.data.getbuffer}",
                textScaleFactor: 1.5,
                style: TextStyle(
                  color: Colors.white,
                )),
            alignment: Alignment.bottomRight,
          ),
          Container(
            height: constraints.maxHeight * 0.25,
            //color: Colors.deepOrangeAccent,
            child: Text("${widget.data.getbuffer}",
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
