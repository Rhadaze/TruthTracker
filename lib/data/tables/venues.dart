import 'package:drift/drift.dart';

class Venues extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get neighborhood => text().nullable()();
  TextColumn get city => text()();
  TextColumn get state => text()();
  TextColumn get country => text()();
  TextColumn get denominacao => text()();
}

  // final int id;
  // final String name;
  // final String country;
  // final String state;
  // final String city;
  // final String? neighborhood;
  // final String denomination;