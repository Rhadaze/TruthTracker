import 'package:drift/drift.dart';

class SermonTable extends Table {
  @override
  String get tableName => 'sermons';

  IntColumn get id => integer().autoIncrement()();
}
