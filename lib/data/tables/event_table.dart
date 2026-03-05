import 'package:TruthTracker/data/tables/sermons_table.dart';
import 'package:TruthTracker/data/tables/venue_table.dart';
import 'package:drift/drift.dart';
import 'preacher_table.dart';

class EventTable extends Table {
  @override
  String get tableName => 'events';

  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();

  //Enums armazenados como texto
  TextColumn get category => text().nullable()();
  TextColumn get type => text().nullable()();

  //Relacionamentos
  IntColumn get sermonId => integer().references(SermonTable, #id)();
  IntColumn get venueId => integer().references(VenueTable, #id)();
  IntColumn get preacherId => integer().references(PreacherTable, #id)();
}
