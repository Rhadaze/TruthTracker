import 'package:TruthTracker/Sermon.dart';
import 'package:flutter/material.dart';

class SermonWidget extends StatelessWidget {
  final Sermon sermon;

  const SermonWidget(this.sermon);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.book),
        title: Text(sermon.theme),
        subtitle: Text(sermon.author.name ?? "No name"),
        trailing: Icon(Icons.menu),
      ),
    );
    throw UnimplementedError();
  }
}
