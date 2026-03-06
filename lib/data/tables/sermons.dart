import 'package:TruthTracker/data/tables/preachers.dart';
import 'package:drift/drift.dart';

class Sermons extends Table {
  IntColumn get id => integer().autoIncrement()();

  // final String title;
  TextColumn get title => text()();

  // final String? theme;
  TextColumn get theme => text().nullable()();

  // final String? mainText;
  TextColumn get mainText => text().nullable()();

  // final String? notes;
  TextColumn get notes => text().nullable()();

  // final DateTime createdAt; //TODO colocar nonnullable e required depois de implementar a persistência
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  // final DateTime? updatedAt;
  DateTimeColumn get updatedAt => dateTime().nullable()();

  // final bool isPublished;
  BoolColumn get isPublished => boolean().withDefault(const Constant(false))();

  // final List<String> tags;
  // TODO to implement in future versions.

  // final Preacher? author;
  IntColumn get authorId => integer().nullable().references(Preachers, #id)();
}
