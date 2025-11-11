import 'package:TruthTracker/PreachedAt.dart';
import 'package:TruthTracker/PreachedAtWidget.dart';
import 'package:TruthTracker/Preacher.dart';
import 'package:TruthTracker/Sermon.dart';
import 'package:TruthTracker/dummy_data.dart';
import 'package:flutter/material.dart';

class PreachedAtPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Preacher> p = DummyData.populatePreachers();
    List<Sermon> s = DummyData.populateSermons(p);
    List<PreachedAt> pa = DummyData.populateData(p, s);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sermoes"),
          backgroundColor: Colors.blue[100],
          leading: Icon(Icons.menu),
        ),
        body: ListView(
          children: [
            PreachedAtWidget(pa[0]),
            PreachedAtWidget(pa[1]),
            PreachedAtWidget(pa[2]),
            PreachedAtWidget(pa[0]),
            PreachedAtWidget(pa[1]),
            PreachedAtWidget(pa[2]),
            PreachedAtWidget(pa[0]),
            PreachedAtWidget(pa[1]),
            PreachedAtWidget(pa[2]),
          ],
        ),
      ),
    );
  }
}
