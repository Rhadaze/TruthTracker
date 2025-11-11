import 'package:TruthTracker/Preacher.dart';
import 'package:TruthTracker/Sermon.dart';
import 'package:TruthTracker/dummy_data.dart';
import 'package:TruthTracker/sermon_widget.dart';
import 'package:flutter/material.dart';

class SermonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Preacher> p = DummyData.populatePreachers();
    List<Sermon> s = DummyData.populateSermons(p);

    return Scaffold(
      appBar: AppBar(title: Text("Sermons Page")),
      body: ListView(
        children: [SermonWidget(s[0]), SermonWidget(s[1]), SermonWidget(s[2])],
      ),
    );
  }
}
