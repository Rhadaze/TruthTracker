import 'package:TruthTracker/features/event/domain/enums/event_type_service.dart';
import 'package:TruthTracker/features/venue/domain/entities/venue.dart';
import 'package:TruthTracker/features/event/domain/entities/event.dart';
import 'package:TruthTracker/features/event/domain/enums/event_category.dart';
import 'package:TruthTracker/features/preacher/domain/entities/preacher.dart';
import 'package:TruthTracker/features/sermon/domain/entities/sermon.dart';

class DummyData {
  static List<Event> populateData() {
    List<Venue> c = populateVenues();
    List<Preacher> p = populatePreachers();
    List<Sermon> s = populateSermons();
    return populateEvents(p, s, c);
  }

  static List<Preacher> populatePreachers() {
    List<Preacher> plist = [];
    plist.add(Preacher(id: 1, name: "Celio Ávila", denomination: "Adventist"));
    plist.add(Preacher(id: 2, name: "Marlon Ávila", denomination: "Adventist"));
    plist.add(
      Preacher(id: 2, name: "Christian Ávila", denomination: "Adventist"),
    );
    plist.add(
      Preacher(id: 3, name: "Nicholas Ávila", denomination: "Adventist"),
    );
    plist.add(
      Preacher(id: 4, name: "Diogo Basualdo", denomination: "Adventist"),
    );
    plist.add(
      Preacher(id: 5, name: "Mateus Advíncola", denomination: "Adventist"),
    );
    plist.add(
      Preacher(id: 6, name: "Marcos Augusto", denomination: "Adventist"),
    );
    plist.add(
      Preacher(id: 7, name: "Kariston Ávila", denomination: "Adventist"),
    );
    plist.add(
      Preacher(id: 8, name: "Bárbara Ávila", denomination: "Adventist"),
    );
    plist.add(
      Preacher(id: 9, name: "Arhessa Ferreira", denomination: "Adventist"),
    );
    return plist;
  }

  static List<Sermon> populateSermons() {
    List<Sermon> slist = [];
    // slist.add(Sermon(id: 1, title: "O Anjo do Senhor"));
    // slist.add(Sermon(id: 2, title: "Ouvindo a voz de Deus"));
    // slist.add(Sermon(id: 3, title: "Verdadeira Educacao"));
    // slist.add(Sermon(id: 4, title: "A terceira mensagem angélica"));
    // slist.add(Sermon(id: 5, title: "O Santuário e sua sombra"));

    return slist;
  }

  static List<Venue> populateVenues() {
    List<Venue> vlist = [];
    // vlist.add(
    //   Venue(
    //     id: 1,
    //     name: "Central - Campo Grande",
    //     bairro: "Centro",
    //     cidade: "Campo Grande",
    //     estado: "MS",
    //     denominacao: "Adventista",
    //   ),
    // );
    // vlist.add(
    //   Venue(
    //     id: 2,
    //     name: "Sede do Bairro Amambaí",
    //     bairro: "Amambaí",
    //     cidade: "Campo Grande",
    //     estado: "MS",
    //     denominacao: "Adventista",
    //   ),
    // );
    // vlist.add(
    //   Venue(
    //     id: 3,
    //     name: "Igreja São Francisco",
    //     bairro: "São Francisco",
    //     cidade: "Campo Grande",
    //     estado: "MS",
    //     denominacao: "Adventista",
    //   ),
    // );
    // vlist.add(
    //   Venue(
    //     id: 4,
    //     name: "Central - Mogi Mirim",
    //     cidade: 'Campo Grande',
    //     estado: 'MS',
    //     denominacao: 'Adventista',
    //   ),
    // );
    // vlist.add(
    //   Venue(
    //     id: 5,
    //     name: "Central - Cuiabá",
    //     cidade: 'Campo Grande',
    //     estado: 'MS',
    //     denominacao: 'Adventista',
    //   ),
    // );
    return vlist;
  }

  static List<Event> populateEvents(
    List<Preacher> p,
    List<Sermon> s,
    List<Venue> c,
  ) {
    Event e1 = Event(
      id: 1,
      category: EventCategory.service,
      type: EventTypeService.saturdayMorning,
      date: DateTime(2025, 12, 1),
      preacher: p[3],
      sermon: s[0],
      venue: c[0],
    );
    Event e2 = Event(
      id: 2,
      category: EventCategory.service,
      type: EventTypeService.adventistYouth,
      date: DateTime(2026, 4, 6),
      preacher: p[1],
      sermon: s[1],
      venue: c[1],
    );
    Event e3 = Event(
      id: 3,
      category: EventCategory.service,
      type: EventTypeService.prayerWeek,
      date: DateTime(2027, 8, 23),
      preacher: p[2],
      sermon: s[2],
      venue: c[2],
    );

    return [e1, e2, e3];
  }
}
