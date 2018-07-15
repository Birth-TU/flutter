import 'package:flutter/material.dart';
import 'package:birth_tu_flutter/utils/date.dart';
import 'dart:async';

class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  int months;
  int days;
  int hours;
  int minutes;
  int seconds;

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: const EdgeInsets.all(2.0),
        margin: const EdgeInsets.all(5.0),
        decoration: new ShapeDecoration(
            shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.all(Radius.circular(3.0)),
        )),
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new TimeSlot(time: months, text: "เดือน"),
              new TimeSlot(time: days, text: "วัน"),
              new TimeSlot(time: hours, text: "ชั่วโมง"),
              new TimeSlot(time: minutes, text: "นาที"),
              new TimeSlot(time: seconds, text: "วินาที"),
            ]));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    const oneSec = const Duration(seconds: 1);
    _calculateDate();
    new Timer.periodic(oneSec, (Timer t) => _calculateDate());
  }

  void _calculateDate() {
    DateTime birthDay = DateTime(getYear(), DateTime.MARCH, 21, 00, 45);
    Duration diff = birthDay.difference(DateTime.now());
    setState(() {
      months = getDaysAndMonths(diff.inDays).months;
      days = getDaysAndMonths(diff.inDays).days;
      hours = diff.inHours - diff.inDays * 24;
      minutes = diff.inMinutes - diff.inHours * 60;
      seconds = diff.inSeconds - diff.inMinutes * 60;
    });
  }
}

class TimeSlot extends StatelessWidget {
  TimeSlot({@required this.time, @required this.text});

  final int time;
  final String text;

  Widget build(context) {
    var multiplier = MediaQuery.of(context).orientation == Orientation.portrait
        ? 0.15
        : 0.09;
    return new Container(
        color: new Color(0xFF00BCD4),
        padding: new EdgeInsets.all(5.0),
        margin: new EdgeInsets.only(left: 5.0, right: 5.0),
        width: multiplier * MediaQuery.of(context).size.width,
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Container(
                  color: Colors.cyan[100],
                  padding: new EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                  margin: new EdgeInsets.only(bottom: 2.0),
                  child: new Text(this.time.toString(),
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 35.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto"))),
              new Text(this.text,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: 15.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto")),
            ]));
  }
}
