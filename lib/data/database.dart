import 'package:TruthTracker/data/tables/events.dart';
import 'package:TruthTracker/data/tables/preachers.dart';
import 'package:TruthTracker/features/event/domain/entities/event.dart';
import 'package:TruthTracker/features/preacher/domain/entities/preacher.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Preachers, Events])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Inserir pregador
  Future<int> insertPreacher(PreachersCompanion preacher) =>
      into(preachers).insert(preacher);

  // Inserir evento
  Future<int> insertEvent(EventsCompanion event) => into(events).insert(event);
  // Buscar eventos com JOIN
  Future<List<EventWithPreacher>> getEventsWithPreacher() async {
    final query = select(
      events,
    ).join([innerJoin(preachers, preachers.id.equalsExp(events.preacherId))]);

    final rows = await query.get();

    return rows.map((row) {
      return EventWithPreacher(
        event: row.readTable(events),
        preacher: row.readTable(preachers),
      );
    }).toList();
  }
}

QueryExecutor _openConnection() {
  return driftDatabase(name: 'truthtracker.db');
}

class EventWithPreacher {
  final Event event;
  final Preacher preacher;

  EventWithPreacher({required this.event, required this.preacher});
}
