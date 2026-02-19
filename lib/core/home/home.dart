import 'package:TruthTracker/features/calendar/presentation/my_calendar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(child: MyCalendar()),
    );
    // TODO: implement build
    //throw UnimplementedError();
  }
}
