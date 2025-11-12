import 'package:TruthTracker/church.dart';
import 'package:TruthTracker/preachedat.dart';
import 'package:TruthTracker/preachedat_widget.dart';
import 'package:TruthTracker/Preacher.dart';
import 'package:TruthTracker/Sermon.dart';
import 'package:TruthTracker/dummy_data.dart';
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
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue[100]),
                child: Text("Menu", style: TextStyle(fontSize: 24)),
              ),
              ListTile(
                title: Text("Sermons"),
                onTap: () => Navigator.pushNamed(context, '/sermons'),
              ),
              ListTile(
                title: Text("Preachers"),
                onTap: () => Navigator.pushNamed(context, '/preachers'),
              ),
              ListTile(
                title: Text("Preached At"),
                onTap: () => Navigator.pushNamed(context, '/preachedAt'),
              ),
              ListTile(
                title: Text("Churches"),
                onTap: () => Navigator.pushNamed(context, '/churches'),
              ),
            ],
          ),
        ),
        body: ListView(children: paWidgets),
      ),
    );
  }
}
