import 'package:TruthTracker/data/database/database.dart';
import 'package:TruthTracker/data/tables/events.dart';
import 'package:TruthTracker/data/tables/preachers.dart';
import 'package:drift/drift.dart';

part 'event_dao.g.dart';

@DriftAccessor(tables: [Events, Preachers])
class EventDao extends DatabaseAccessor<AppDatabase> with _$EventDaoMixin {
  EventDao(super.db);

  Future<int> insertEvent(EventsCompanion companion) {
    return into(events).insert(companion);
  }

  Future<int> upsertEvent(EventsCompanion companion) {
    return into(events).insertOnConflictUpdate(companion);
  }

  Future<List<EventData>> getAll({bool desc = true}) {
    final ordering = desc
        ? OrderingTerm.desc(events.date)
        : OrderingTerm.asc(events.date);

    return (select(events)..orderBy([(_) => ordering])).get();
  }

  Future<List<EventData>> getAllByVenue(int venueId, {bool desc = true}) {
    final ordering = desc
        ? OrderingTerm.desc(events.date)
        : OrderingTerm.asc(events.date);

    return (select(events)
          ..where((t) => t.venueId.equals(venueId))
          ..orderBy([(t) => ordering]))
        .get();
  }

  Future<EventData?> getById(int id) {
    return (select(events)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  // Future<List<Event>> searchByName(String query) {
  //   //TODO preciso normalizar essa busca
  //   final q = query.trim();
  //   if (q.isEmpty) return Future.value([]);

  //   return (select(events)
  //         ..where((t) => t.name.like('%$q%'))
  //         ..orderBy([(t) => OrderingTerm.asc(t.name)]))
  //       .get();
  // }

  Future<bool> updateEvent(EventData event) {
    return update(events).replace(event);
  }

  Future<int> updateEventVenue({required int eventId, required int venueId}) {
    return (update(events)..where((t) => t.id.equals(eventId))).write(
      EventsCompanion(venueId: Value(venueId)),
    );
  } // TODO ta certo isso? Ele identifique o objeto a ser updated, mas não entrega informação nova.

  Future<int> deleteById(int id) {
    return (delete(events)..where((t) => t.id.equals(id))).go();
  }

  Stream<List<EventData>> watchByDate(DateTime selectedDate) {
    // TODO arrumar date para não considerar hora e segundo
    return (select(events)
          ..where((t) => t.date.equals(selectedDate))
          ..orderBy([(t) => OrderingTerm.asc(t.date)]))
        .watch();
  }

  Stream<List<EventData>> watchByDateAndPreacher(
    // TODO arrumar date para não considerar hora e segundo
    DateTime selectedDate,
    int preacherId,
  ) {
    return (select(events)
          ..where(
            (t) =>
                t.date.equals(selectedDate) & t.preacherId.equals(preacherId),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.date),
            (t) => OrderingTerm.asc(
              t.preacherId,
            ), //TODO precisava ser preacher name
          ]))
        .watch();
  }

  Stream<EventData?> watchById(int id) {
    return (select(events)..where((t) => t.id.equals(id))).watchSingleOrNull();
  }
}
  // Future<List<EventWithPreacher>> getEventsWithPreacher() async {
  //   final query = select(events).join([
  //     innerJoin(
  //       preacherTable,
  //       preacherTable.id.equalsExp(events.preacherId),
  //     ),
  //   ]);

  //   final rows = await query.get();

  //   return rows.map((row) {
  //     return EventWithPreacher(
  //       event: row.readTable(events),
  //       preacher: row.readTable(preacherTable),
  //     );
  //   }).toList();
  // }

// class EventWithPreacher {
//   final Event event;
//   final PreacherTableData preacher;

//   EventWithPreacher({required this.event, required this.preacher});
// }
