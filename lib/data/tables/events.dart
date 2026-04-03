import 'package:TruthTracker/data/tables/sermons.dart';
import 'package:TruthTracker/data/tables/venues.dart';
import 'package:drift/drift.dart';
import 'preachers.dart';

@DataClassName('EventData')
class Events extends Table {

  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();

  //Enums armazenados como texto
  TextColumn get category => text().nullable()();
  TextColumn get type => text().nullable()();

  //Relacionamentos 
  IntColumn get sermonId => integer().nullable().references(Sermons, #id)();
  IntColumn get venueId => integer().references(Venues, #id)();
  IntColumn get preacherId => integer().references(Preachers, #id)();
}