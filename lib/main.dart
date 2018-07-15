import 'package:flutter/material.dart';
import 'widget/countdown_timer.dart';
import 'package:birth_tu_flutter/services/audio.dart';
import 'package:birth_tu_flutter/utils/date.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Birth-TU',
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

  Icon fabIcon = const Icon(Icons.volume_up);

  void _toggleFab() {
    setState((){
      if ( !AudioService.isPlaying ) fabIcon = const Icon(Icons.volume_up);
      else fabIcon = const Icon(Icons.volume_off);
    });
  }
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
        color: Colors.cyan[300],
        child: new Center( child: new Column (
          children: <Widget>[
            new Container(
                margin: new EdgeInsets.only(bottom: 20.0, top: 40.0),
              child: new Column(
                children: <Widget>[
                  new Text("How long until \"his birthday\" ?",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 35.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto"
                      )),
                  new Text("He will resolve the promise. Let's not take too long ...",
                      textAlign: TextAlign.center,
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
                    new Text("Wish you were healthiness",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"
                        )),
                    new Text("Counting down from 21 March " + getYear().toString() + " BE at 00:45 (GMT +0700)",
                        textAlign: TextAlign.center,
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
      floatingActionButton:  new FloatingActionButton(
        backgroundColor: Colors.redAccent,
          child: fabIcon,
          onPressed: () {
            AudioService.toggle();
            _toggleFab();
          }
      ),
    );
  }
}
