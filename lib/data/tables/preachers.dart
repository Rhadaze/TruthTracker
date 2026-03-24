import 'package:drift/drift.dart';

@DataClassName('PreacherData')
class Preachers extends Table {

  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get languages => text().nullable()();
  TextColumn get denomination => text().nullable()();
}