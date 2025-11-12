import 'package:TruthTracker/church_page.dart';
import 'package:TruthTracker/preachedat_page.dart';
import 'package:TruthTracker/preacher_page.dart';
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
      // home: PreachedAtPage(),
      initialRoute: '/preachedAt',
      routes: {
        '/sermons': (context) => SermonPage(),
        '/preachers': (context) => PreacherPage(),
        '/preachedAt': (context) => PreachedAtPage(),
        '/churches': (context) => ChurchPage(),
      },
    ); // TODO: implement build
  }
}
