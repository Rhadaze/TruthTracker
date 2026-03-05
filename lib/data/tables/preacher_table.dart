import 'package:drift/drift.dart';

class PreacherTable extends Table {
  @override
  String get tableName => 'preachers';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get languages => text().nullable()();
  TextColumn get denomination => text().nullable()();
}
