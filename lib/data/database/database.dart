import 'package:TruthTracker/data/database/preacher_dao.dart';
import 'package:TruthTracker/data/tables/event_table.dart';
import 'package:TruthTracker/data/tables/preacher_table.dart';
import 'package:TruthTracker/data/tables/sermons_table.dart';
import 'package:TruthTracker/data/tables/venue_table.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [PreacherTable, EventTable, SermonTable, VenueTable],
  daos: [PreacherDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  // TODO ativar posteriormente. Queria só anotar isso aqui para estudar melhor depois.
  // LazyDatabase _openConnection() {
  //   return LazyDatabase(() async {
  //     return driftDatabase(name: 'truthtracker.db');
  //   });
  // }

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'truthtracker.db');
  }

  @override
  int get schemaVersion => 1;

  // Inserir evento
  Future<int> insertEvent(EventTableCompanion event) =>
      into(eventTable).insert(event);
}
