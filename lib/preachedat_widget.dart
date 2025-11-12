import 'package:TruthTracker/preachedat.dart';
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
        tileColor: Colors.blue[100],
        hoverColor: Colors.green[300],
        focusColor: Colors.blue[800],
        selectedColor: Colors.amber[800],
        leading: SizedBox(
          height: 88,
          width: 56,
          child: Center(child: Icon(Icons.access_time)),
        ),
        title: Text(pa.sermon.theme),
        subtitle: Text(
          "pregador: ${pa.preacher.name}\nData: ${pa.date?.toLocal().toString().split(' ')[0]}",
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

  static List<PreachedAtWidget> fromList(List<PreachedAt> palist) {
    return palist.map((pa) => PreachedAtWidget(pa)).toList();
  }
}
