import 'package:TruthTracker/data/tables/preachers.dart';
import 'package:drift/drift.dart';

@DataClassName('SermonData')
class Sermons extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();
  TextColumn get theme => text().nullable()();
  TextColumn get mainText => text().nullable()();
  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  BoolColumn get isPublished => boolean().withDefault(const Constant(false))();

  IntColumn get authorId => integer().nullable().references(Preachers, #id)();
}