import 'package:TruthTracker/core/layout/app_drawer.dart';
import 'package:TruthTracker/features/church/data/church.dart';
import 'package:TruthTracker/preachedat.dart';
import 'package:TruthTracker/features/preached_at/presentation/preachedat_widget.dart';
import 'package:TruthTracker/Preacher.dart';
import 'package:TruthTracker/Sermon.dart';
import 'package:TruthTracker/core/data/dummy_data.dart';
import 'package:flutter/material.dart';

class PreachedAtPage extends StatelessWidget {
  final List<Preacher> p;
  final List<Sermon> s;
  final List<Church> c;
  final List<PreachedAt> pa;

  PreachedAtPage()
    : c = [],
      p = DummyData.populatePreachers(),
      s = [],
      pa = [] {
    c.addAll(DummyData.populateChurches());
    s.addAll(DummyData.populateSermons(p));
    pa.addAll(DummyData.populateData(p, s, c));
  }

  @override
  Widget build(BuildContext context) {
    final List<PreachedAtWidget> paWidgets = PreachedAtWidget.fromList(pa);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Preached At"),
          backgroundColor: Colors.blue[100],
          //leading: Icon(Icons.menu),
        ),
        drawer: AppDrawer(),
        body: ListView(children: paWidgets),
      ),
    );
  }
}
