import 'package:TruthTracker/preachedat_page.dart';
import 'package:TruthTracker/sermon_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const YourApp());
}

class YourApp extends StatelessWidget {
  const YourApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PreachedAtPage(),
      routes: {
        '/sermons': (context) => SermonPage(),
        //'/preachers': (context) => PreacherPage(),
        '/preachedAt': (context) => PreachedAtPage(),
      },
    ); // TODO: implement build
    throw UnimplementedError();
  }
}
