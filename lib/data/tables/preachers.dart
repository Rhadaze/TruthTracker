import 'package:TruthTracker/data/tables/events.dart';
import 'package:drift/drift.dart';

class Preachers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get email => text()();
  TextColumn get phone => text()();
  TextColumn get languages => text()();
  TextColumn get denomination => text()();

  IntColumn get eventId => integer().references(Events, #id)();
}
