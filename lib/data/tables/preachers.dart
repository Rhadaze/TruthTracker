import 'package:drift/drift.dart';

@DataClassName('PreacherData')
class Preachers extends Table {
  // @override
  // String get tableName => 'preachers';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get languages => text().nullable()();
  TextColumn get denomination => text().nullable()();
}

  // final int id;
  // final String name;
  // final String? email;
  // final String? phone;
  // final String? languages;
  // final String? denomination;