import 'package:TruthTracker/data/database/daos/event_dao.dart';
import 'package:TruthTracker/data/database/daos/preacher_dao.dart';
import 'package:TruthTracker/features/sermon/data/daos/sermon_dao.dart';
import 'package:TruthTracker/data/database/daos/venue_dao.dart';
import 'package:TruthTracker/data/tables/events.dart';
import 'package:TruthTracker/data/tables/preachers.dart';
import 'package:TruthTracker/data/tables/sermons.dart';
import 'package:TruthTracker/data/tables/venues.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [Preachers, Events, Sermons, Venues],
  daos: [PreacherDao, EventDao, SermonDao, VenueDao],
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
}
