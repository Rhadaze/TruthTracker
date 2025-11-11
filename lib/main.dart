import 'package:TruthTracker/sermons_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const YourApp());
}

class YourApp extends StatelessWidget {
  const YourApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SermonsPage()); // TODO: implement build
    throw UnimplementedError();
  }
}
