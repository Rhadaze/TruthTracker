import 'package:TruthTracker/Sermon.dart';
import 'package:flutter/material.dart';

class SermonWidget extends StatelessWidget {
  final Sermon sermon;

  const SermonWidget(this.sermon);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(),
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        tileColor: Colors.green[50],
        hoverColor: Colors.green[300],
        focusColor: Colors.green[800],
        selectedColor: Colors.amber[800],
        leading: SizedBox(
          height: 88,
          width: 56,
          child: Center(child: Icon(Icons.book)),
        ),
        title: Text(sermon.theme),
        subtitle: Text(sermon.author.name ?? "No name"),
        trailing: SizedBox(
          height: 88,
          width: 56,
          child: Center(child: Icon(Icons.menu)),
        ),
      ),
    );
    throw UnimplementedError();
  }
}
