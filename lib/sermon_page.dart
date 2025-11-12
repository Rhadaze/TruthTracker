import 'package:TruthTracker/Preacher.dart';
import 'package:TruthTracker/Sermon.dart';
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
      body: ListView(children: sermonWidgets),
    );
  }
}
