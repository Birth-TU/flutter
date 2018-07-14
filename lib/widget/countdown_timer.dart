import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: const EdgeInsets.all(2.0),
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new TimeSlot(time: 10 , text: "เดือน"),
              new TimeSlot(time: 10 , text: "วัน"),
              new TimeSlot(time: 10 , text: "ชั่วโมง"),
              new TimeSlot(time: 10 , text: "นาที"),
              new TimeSlot(time: 10 , text: "วินาที"),
        ])
    );
  }
}

class TimeSlot extends StatelessWidget {

  TimeSlot({@required this.time, @required this.text});
  final int time;
  final String text;

  Widget build(context) {
    return new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text(this.text,
              style: new TextStyle(
                  fontSize: 12.0,
                  color: const Color(0xFF000000),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto")),
          new Text(this.time.toString(),
              style: new TextStyle(
                  fontSize: 12.0,
                  color: const Color(0xFF000000),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"))
        ]);
  }
}