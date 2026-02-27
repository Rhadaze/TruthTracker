import 'package:TruthTracker/features/venue/domain/entities/venue.dart';
import 'package:TruthTracker/features/event/domain/entities/event.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type.dart';
import 'package:TruthTracker/features/preacher/domain/entities/preacher.dart';
import 'package:TruthTracker/features/sermon/domain/entities/sermon.dart';

class DummyData {
  static List<Event> populateData() {
    List<Venue> c = populateVenues();
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

  static List<Venue> populateVenues() {
    Venue c1 = Venue(
      name: "Igreja Central",
      bairro: "Centro",
      cidade: "Campo Grande",
      estado: "MS",
      denominacao: "Adventista",
    );
    Venue c2 = Venue(
      name: "Sede do Bairro Amambaí",
      bairro: "Amambaí",
      cidade: "Campo Grande",
      estado: "MS",
      denominacao: "Adventista",
    );
    Venue c3 = Venue(
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
    List<Venue> c,
  ) {
    Event e1 = Event(
      type: EventCategory.service,
      place: "Campo Grande",
      date: DateTime(2025, 12, 1),
      preacher: p[3],
      sermon: s[0],
      venue: c[0],
    );
    Event e2 = Event(
      type: EventCategory.service,
      place: "Cuiaba",
      date: DateTime(2026, 4, 6),
      preacher: p[1],
      sermon: s[1],
      venue: c[1],
    );
    Event e3 = Event(
      type: EventCategory.service,
      place: "Curitiba",
      date: DateTime(2027, 8, 23),
      preacher: p[2],
      sermon: s[2],
      venue: c[2],
    );

    return [e1, e2, e3];
  }
}
