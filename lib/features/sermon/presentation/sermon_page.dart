import 'package:TruthTracker/Preacher.dart';
import 'package:TruthTracker/Sermon.dart';
import 'package:TruthTracker/core/layout/app_drawer.dart';
import 'package:TruthTracker/core/data/dummy_data.dart';
import 'package:TruthTracker/features/sermon/presentation/sermon_widget.dart';
import 'package:flutter/material.dart';

class SermonPage extends StatelessWidget {
  final List<Preacher> p;
  final List<Sermon> s;

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
