import 'package:TruthTracker/data/database/database.dart';
import 'package:TruthTracker/data/tables/event_table.dart';
import 'package:TruthTracker/data/tables/preacher_table.dart';
import 'package:drift/drift.dart';

part 'event_dao.g.dart';

@DriftAccessor(tables: [EventTable, PreacherTable])
class EventDao extends DatabaseAccessor<AppDatabase> with _$EventDaoMixin {
  EventDao(super.db);

  Future<int> insertEvent(EventTableCompanion companion) {
    return into(eventTable).insert(companion);
  }

  Future<int> upsertEvent(EventTableCompanion companion) {
    return into(eventTable).insertOnConflictUpdate(companion);
  }

  Future<List<EventTableData>> getAll({bool desc = true}) {
    final ordering = desc
        ? OrderingTerm.desc(eventTable.date)
        : OrderingTerm.asc(eventTable.date);

    return (select(eventTable)..orderBy([(_) => ordering])).get();
  }

  Future<List<EventTableData>> getAllByVenue(int venueId, {bool desc = true}) {
    final ordering = desc
        ? OrderingTerm.desc(eventTable.date)
        : OrderingTerm.asc(eventTable.date);

    return (select(eventTable)
          ..where((t) => t.venueId.equals(venueId))
          ..orderBy([(t) => ordering]))
        .get();
  }

  Future<EventTableData?> getById(int id) {
    return (select(
      eventTable,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  // Future<List<EventTableData>> searchByName(String query) {
  //   //TODO preciso normalizar essa busca
  //   final q = query.trim();
  //   if (q.isEmpty) return Future.value([]);

  //   return (select(eventTable)
  //         ..where((t) => t.name.like('%$q%'))
  //         ..orderBy([(t) => OrderingTerm.asc(t.name)]))
  //       .get();
  // }

  Future<bool> updateEvent(EventTableData event) {
    return update(eventTable).replace(event);
  }

  Future<int> updateEventVenue({required int eventId, required int venueId}) {
    return (update(eventTable)..where((t) => t.id.equals(eventId))).write(
      EventTableCompanion(venueId: Value(venueId)),
    );
  }

  Future<int> deleteById(int id) {
    return (delete(eventTable)..where((t) => t.id.equals(id))).go();
  }

  Stream<List<EventTableData>> watchByDate(DateTime selectedDate) {
    return (select(eventTable)
          ..where((t) => t.date.equals(selectedDate))
          ..orderBy([(t) => OrderingTerm.asc(t.date)]))
        .watch();
  }

  Stream<List<EventTableData>> watchByDateAndPreacher(
    DateTime selectedDate,
    int preacherId,
  ) {
    return (select(eventTable)
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

  Stream<EventTableData?> watchById(int id) {
    return (select(
      eventTable,
    )..where((t) => t.id.equals(id))).watchSingleOrNull();
  }
}
  // Future<List<EventWithPreacher>> getEventsWithPreacher() async {
  //   final query = select(eventTable).join([
  //     innerJoin(
  //       preacherTable,
  //       preacherTable.id.equalsExp(eventTable.preacherId),
  //     ),
  //   ]);

  //   final rows = await query.get();

  //   return rows.map((row) {
  //     return EventWithPreacher(
  //       event: row.readTable(eventTable),
  //       preacher: row.readTable(preacherTable),
  //     );
  //   }).toList();
  // }

// class EventWithPreacher {
//   final EventTableData event;
//   final PreacherTableData preacher;

//   EventWithPreacher({required this.event, required this.preacher});
// }
