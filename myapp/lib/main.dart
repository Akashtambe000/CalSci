import 'package:flutter/material.dart';
import './buttons.dart';
import './Screen.dart';

part 'MyColors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CalSci',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.teal[600],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'CalSci'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // appbar widget
    final appBar = AppBar(
      title: Text(
        widget.title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Theme.of(context).accentColor,
    );

    // mediaquery widget
    final mediaQuery = MediaQuery.of(context);

    // appheight
    final appHeight = (mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top);

    final double mainPadding = 10;

    return Scaffold(
        appBar: appBar,
        body: Container(
          padding: EdgeInsets.all(mainPadding),
          height: appHeight,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 20),
                height: appHeight * 0.45,
                child: Screen(),
              ),
              Container(
                height: appHeight * 0.50 - mainPadding,
                child: Buttons(),
              ),
            ],
          ),
        ));
  }
}
