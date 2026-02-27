import 'package:drift/drift.dart';
import 'preachers.dart';

class Events extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get date => dateTime()();

  IntColumn get preacherId => integer().references(Preachers, #id)();
}
