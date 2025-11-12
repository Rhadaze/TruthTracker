import 'package:TruthTracker/Preacher.dart';
import 'package:flutter/material.dart';

class PreacherWidget extends StatelessWidget {
  final Preacher preacher;

  const PreacherWidget(this.preacher);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(),
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        tileColor: Colors.orange[100],
        hoverColor: Colors.orange[300],
        focusColor: Colors.orange[800],
        selectedColor: Colors.amber[800],
        leading: SizedBox(
          height: 88,
          width: 56,
          child: Center(child: Icon(Icons.person)),
        ),
        title: Text(preacher.name),
        //subtitle: Text("Número de sermones: ${preacher.sermons.length}"),
        trailing: SizedBox(
          height: 88,
          width: 56,
          child: Center(child: Icon(Icons.menu)),
        ),
      ),
    );
  }
}
