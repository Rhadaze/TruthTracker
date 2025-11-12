import 'package:TruthTracker/church.dart';
import 'package:TruthTracker/church_widget.dart';
import 'package:TruthTracker/dummy_data.dart';
import 'package:flutter/material.dart';

class ChurchPage extends StatelessWidget {
  final List<Church> c = DummyData.populateChurches();

  @override
  Widget build(BuildContext context) {
    final List<ChurchWidget> cWidgets = ChurchWidget.fromList(c);

    return Scaffold(
      appBar: AppBar(title: Text('Chuches'), backgroundColor: Colors.blue[100]),
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
      body: ListView(children: cWidgets),
    );
  }
}
