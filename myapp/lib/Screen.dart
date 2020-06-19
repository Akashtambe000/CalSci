part of 'main.dart';

class Screen extends StatefulWidget {
  final String buffer;
  Screen({Key key, this.buffer}) : super(key: key);
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
      child: Text(widget.buffer,
        style: TextStyle(
          fontSize: 36
        ),
      ),
    );
  }
  
}