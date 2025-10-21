import 'package:TruthTracker/PreachedAt.dart';
import 'package:TruthTracker/PreachedAtWidget.dart';
import 'package:TruthTracker/Preacher.dart';
import 'package:TruthTracker/Sermon.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const YourApp());
}

class YourApp extends StatelessWidget {
  const YourApp({super.key});

  @override
  Widget build(BuildContext context) {
    Preacher p1 = Preacher(name: "Celio");
    Preacher p2 = Preacher(name: "Marlon");
    Preacher p3 = Preacher(name: "Christian");
    Preacher p4 = Preacher(name: "Nicholas");

    Sermon s1 = Sermon(author: p1, theme: "O Anjo do Senhor");
    Sermon s2 = Sermon(author: p2, theme: "Ouvindo a voz de Deus");
    Sermon s3 = Sermon(author: p3, theme: "Verdadeira Educacao");

    PreachedAt pa1 = PreachedAt(
      place: "Campo Grande",
      date: DateTime(2025, 12, 1),
      preacher: p4,
      sermon: s1,
    );
    PreachedAt pa2 = PreachedAt(
      place: "Cuiaba",
      date: DateTime(2026, 4, 6),
      preacher: p2,
      sermon: s2,
    );
    PreachedAt pa3 = PreachedAt(
      place: "Curitiba",
      date: DateTime(2027, 8, 23),
      preacher: p4,
      sermon: s3,
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sermoes"),
          backgroundColor: Colors.blue[100],
          leading: Icon(Icons.menu),
        ),
        body: Column(
          children: [
            PreachedAtWidget(pa1),
            PreachedAtWidget(pa2),
            PreachedAtWidget(pa3),
          ],
        ),
      ),
    );
  }
}
