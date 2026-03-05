import 'package:drift/drift.dart';

class VenueTable extends Table {
  @override
  String get tableName => 'venues';

  IntColumn get id => integer().autoIncrement()();
}
