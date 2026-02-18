import 'package:TruthTracker/features/church/domain/entities/church.dart';
import 'package:TruthTracker/features/event/domain/entities/event.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type.dart';
import 'package:TruthTracker/features/preacher/data/preacher.dart';
import 'package:TruthTracker/features/sermon/data/sermon.dart';

class DummyData {
  static List<Event> populateData() {
    List<Church> c = populateChurches();
    List<Preacher> p = populatePreachers();
    List<Sermon> s = populateSermons(p);
    return populateEvents(p, s, c);
  }

  static List<Preacher> populatePreachers() {
    List<Preacher> plist = [];
    plist.add(Preacher(name: "Celio Ávila", denomination: "Adventist"));
    plist.add(Preacher(name: "Marlon Ávila", denomination: "Adventist"));
    plist.add(Preacher(name: "Christian Ávila", denomination: "Adventist"));
    plist.add(Preacher(name: "Nicholas Ávila", denomination: "Adventist"));
    plist.add(Preacher(name: "Diogo Basualdo", denomination: "Adventist"));
    plist.add(Preacher(name: "Mateus Advíncola", denomination: "Adventist"));
    plist.add(Preacher(name: "Marcos Augusto", denomination: "Adventist"));

    return plist;
  }

  static List<Sermon> populateSermons(List<Preacher> p) {
    Sermon s1 = Sermon(author: p[0], theme: "O Anjo do Senhor");
    Sermon s2 = Sermon(author: p[1], theme: "Ouvindo a voz de Deus");
    Sermon s3 = Sermon(author: p[2], theme: "Verdadeira Educacao");

    return [s1, s2, s3];
  }

  static List<Church> populateChurches() {
    Church c1 = Church(
      name: "Igreja Central",
      bairro: "Centro",
      cidade: "Campo Grande",
      estado: "MS",
      denominacao: "Adventista",
    );
    Church c2 = Church(
      name: "Sede do Bairro Amambaí",
      bairro: "Amambaí",
      cidade: "Campo Grande",
      estado: "MS",
      denominacao: "Adventista",
    );
    Church c3 = Church(
      name: "Igreja São Francisco",
      bairro: "São Francisco",
      cidade: "Campo Grande",
      estado: "MS",
      denominacao: "Adventista",
    );

    return [c1, c2, c3];
  }

  static List<Event> populateEvents(
    List<Preacher> p,
    List<Sermon> s,
    List<Church> c,
  ) {
    Event e1 = Event(
      type: EventType.saturdayMorning,
      place: "Campo Grande",
      date: DateTime(2025, 12, 1),
      preacher: p[3],
      sermon: s[0],
      church: c[0],
    );
    Event e2 = Event(
      type: EventType.saturdayMorning,
      place: "Cuiaba",
      date: DateTime(2026, 4, 6),
      preacher: p[1],
      sermon: s[1],
      church: c[1],
    );
    Event e3 = Event(
      type: EventType.saturdayMorning,
      place: "Curitiba",
      date: DateTime(2027, 8, 23),
      preacher: p[2],
      sermon: s[2],
      church: c[2],
    );

    return [e1, e2, e3];
  }
}
