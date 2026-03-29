import 'package:drift/drift.dart';

@DataClassName('VenueData')
class Venues extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get neighborhood => text().nullable()();
  TextColumn get city => text()();
  TextColumn get state => text()();
  TextColumn get country => text()();
  TextColumn get denomination => text()();
  TextColumn get type => text()();
}