import 'package:flutter/material.dart';
import 'widget/countdown_timer.dart';
import 'package:birth_x_flutter/services/audio.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Birth-X',
      theme: new ThemeData(
        primarySwatch: Colors.cyan,
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

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    AudioService.init();
    AudioService.play();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    AudioService.stop();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: Colors.cyan,
        child: new Center( child: new Column (
          children: <Widget>[
            new Container(
                margin: new EdgeInsets.only(bottom: 20.0, top: 40.0),
              child: new Column(
                children: <Widget>[
                  new Text("How long until \"his birthday\" ?",
                      style: new TextStyle(
                          fontSize: 40.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto"
                      )),
                  new Text("He will resolve the promise. Let's not take too long ...",
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
            new Container (
                margin: new EdgeInsets.only(top: 5.0),
              child: new Column(
                  children: <Widget>[
                    new Text("Wish you were healthtieness",
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"
                        )),
                    new Text("Counting down from 21 March 2561 BE at 00:45 (GMT +0700)",
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"
                        )),
                  ]
              )
            )
          ],
        ) )
      ),
    );
  }
}
