import 'package:TruthTracker/Preacher.dart';
import 'package:TruthTracker/Sermon.dart';
import 'package:TruthTracker/app_drawer.dart';
import 'package:TruthTracker/dummy_data.dart';
import 'package:TruthTracker/sermon_widget.dart';
import 'package:flutter/material.dart';

class SermonPage extends StatelessWidget {
  List<Preacher> p;
  List<Sermon> s;

  SermonPage() : p = DummyData.populatePreachers(), s = [] {
    s.addAll(DummyData.populateSermons(p));
  }

  @override
  Widget build(BuildContext context) {
    final List<SermonWidget> sermonWidgets = SermonWidget.fromList(s);

    return Scaffold(
      appBar: AppBar(title: Text("Sermons")),
      drawer: AppDrawer(),
      body: ListView(children: sermonWidgets),
    );
  }
}
