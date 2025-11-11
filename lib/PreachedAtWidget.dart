import 'package:TruthTracker/PreachedAt.dart';
import 'package:flutter/material.dart';

class PreachedAtWidget extends StatelessWidget {
  final PreachedAt pa;

  const PreachedAtWidget(this.pa);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(),
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        isThreeLine: false,
        focusColor: Colors.blue[800],
        tileColor: Colors.blue[100],
        hoverColor: Colors.green,
        selectedColor: Colors.amber,
        leading: SizedBox(
          height: 88,
          width: 56,
          child: Center(child: Icon(Icons.access_time)),
        ),
        title: Text(pa.sermon.theme),
        subtitle: Text(
          "autor: ${pa.sermon.author.name}\npregador: ${pa.preacher.name}",
        ),
        trailing: SizedBox(
          height: 88,
          width: 56,
          child: Center(child: Icon(Icons.menu)),
        ),
        onTap: () {
          print("hi");
        },
      ),
    );
    //throw UnimplementedError();
  }
}
