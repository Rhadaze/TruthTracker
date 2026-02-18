import 'package:TruthTracker/core/home/home.dart';
import 'package:TruthTracker/features/about/about_page.dart';
import 'package:TruthTracker/features/church/presentation/church_page.dart';
import 'package:TruthTracker/features/event/presentation/events_page.dart';
import 'package:TruthTracker/features/preacher/presentation/preacher_page.dart';
import 'package:TruthTracker/features/sermon/presentation/sermon_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const YourApp());
}

class YourApp extends StatelessWidget {
  const YourApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/events': (context) => EventsPage(),
        '/sermons': (context) => SermonPage(),
        '/preachers': (context) => PreacherPage(),
        '/churches': (context) => ChurchPage(),
        '/about': (context) => AboutPage(),
      },
    ); // TODO: implement build
  }
}
