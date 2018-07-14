import 'package:flutter/material.dart';
import 'widget/countdown_timer.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Birth-X',
      theme: new ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: new MyHomePage(title: 'Birth-X'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: Colors.yellow,
        child: new Center( child: new Column (
          children: <Widget>[
            new Container(
                margin: new EdgeInsets.only(bottom: 20.0, top: 30.0),
              child: new Column(
                children: <Widget>[
                  new Text("นานแค่ไหน จะวันเกิด",
                      style: new TextStyle(
                          fontSize: 40.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto"
                      )),
                  new Text("เขาจะทำตามสัญญา ขอเวลาขับเครื่องบิน ...",
                      style: new TextStyle(
                          fontSize: 20.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto"
                      )),
                ]
              )
            ),
            new CountdownTimer(),
          ],
        ) )
      ),
    );
  }
}
