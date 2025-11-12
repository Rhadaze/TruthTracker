import 'package:TruthTracker/Preacher.dart';
import 'package:TruthTracker/dummy_data.dart';
import 'package:flutter/material.dart';

class PreacherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Preacher")),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue[200]),
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
    );
  }
}
