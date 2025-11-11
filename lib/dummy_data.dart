import 'package:TruthTracker/preachedat.dart';
import 'package:TruthTracker/Preacher.dart';
import 'package:TruthTracker/Sermon.dart';

class DummyData {
  static List<Preacher> populatePreachers() {
    Preacher p1 = Preacher(name: "Celio");
    Preacher p2 = Preacher(name: "Marlon");
    Preacher p3 = Preacher(name: "Christian");
    Preacher p4 = Preacher(name: "Nicholas");

    return [p1, p2, p3, p4];
  }

  static List<Sermon> populateSermons(List<Preacher> p) {
    Sermon s1 = Sermon(author: p[0], theme: "O Anjo do Senhor");
    Sermon s2 = Sermon(author: p[1], theme: "Ouvindo a voz de Deus");
    Sermon s3 = Sermon(author: p[2], theme: "Verdadeira Educacao");

    return [s1, s2, s3];
  }

  static List<PreachedAt> populateData(List<Preacher> p, List<Sermon> s) {
    PreachedAt pa1 = PreachedAt(
      place: "Campo Grande",
      date: DateTime(2025, 12, 1),
      preacher: p[3],
      sermon: s[0],
    );
    PreachedAt pa2 = PreachedAt(
      place: "Cuiaba",
      date: DateTime(2026, 4, 6),
      preacher: p[1],
      sermon: s[1],
    );
    PreachedAt pa3 = PreachedAt(
      place: "Curitiba",
      date: DateTime(2027, 8, 23),
      preacher: p[2],
      sermon: s[2],
    );

    return [pa1, pa2, pa3];
  }
}
