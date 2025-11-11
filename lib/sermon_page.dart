import 'package:TruthTracker/Preacher.dart';
import 'package:TruthTracker/Sermon.dart';
import 'package:TruthTracker/dummy_data.dart';
import 'package:TruthTracker/sermon_widget.dart';
import 'package:flutter/material.dart';

class SermonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Preacher> p = DummyData.populatePreachers();
    List<Sermon> s = DummyData.populateSermons(p);

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
      body: ListView(
        children: [SermonWidget(s[0]), SermonWidget(s[1]), SermonWidget(s[2])],
      ),
    );
  }
}
