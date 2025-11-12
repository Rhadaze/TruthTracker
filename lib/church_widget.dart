import 'package:TruthTracker/church.dart';
import 'package:flutter/material.dart';

class ChurchWidget extends StatelessWidget {
  final Church c;

  ChurchWidget(this.c);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(c.name),
        subtitle: Text("Bairro ${c.bairro} em ${c.cidade}.\n${c.denominacao}"),
      ),
    );
  }

  static List<ChurchWidget> fromList(List<Church> churches) {
    return churches.map((c) => ChurchWidget(c)).toList();
  }
}
