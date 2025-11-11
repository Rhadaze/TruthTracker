import 'package:TruthTracker/preachedat.dart';
import 'package:TruthTracker/preachedat_widget.dart';
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
            ],
          ),
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
