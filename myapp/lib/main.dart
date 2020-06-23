
import 'package:flutter/material.dart';
import 'dart:math';

part 'MyColors.dart';
part 'Screen.dart';

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
        primarySwatch: MyColors.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'fx-991ES+'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int power = 0;
  ScreenData screen;

  void _incrementCounter() {
    setState(() {
      _counter++;
      power = pow(2,_counter);
      screen.add("$_counter");
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter--;
      power = pow(2,_counter);
      screen.remove();
    });
  }
  void _clearCounter() {
    setState(() {
      _counter = 0;
      power = 0;
      screen.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            Screen(data:screen),
            RaisedButton(
              onPressed: _incrementCounter,
              child: Icon(Icons.add),
            ), 
            RaisedButton(
              onPressed: _decrementCounter,
              child: Icon(Icons.remove),
            ),
            RaisedButton(
              onPressed: _clearCounter,
              child: Text("C"),
            ),
          ],
        ),
      ), 
    );
  }
}
