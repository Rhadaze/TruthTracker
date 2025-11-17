import 'package:TruthTracker/features/church/presentation/church_page.dart';
import 'package:TruthTracker/features/preached_at/presentation/preachedat_page.dart';
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
