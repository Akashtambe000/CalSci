part of 'main.dart';

class ScreenData {
  String buffer;

  ScreenData({this.buffer});

  void add(String value){
    buffer += value;
  }

  void remove({int n=1}){
    buffer = buffer.substring(0,buffer.length-n);
  }

  void clear(){
    buffer = "";
  }

  @override
  String toString(){
    return buffer.toString();
  }
}

class Screen extends StatefulWidget {
  final ScreenData data;
  Screen({Key key, this.data}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new ScreenState();
  }

}

class ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.amber,
      padding: EdgeInsets.all(screenWidth * 0.01),
      width:  screenWidth* 0.9,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Stack(
          children: <Widget>[
            Text(widget.data.toString(),
            style: TextStyle(
              fontSize: 36
            ),
          ),
        ],
      ),
    );
  }
  
}