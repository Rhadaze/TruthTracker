import 'package:TruthTracker/data/tables/preachers.dart';
import 'package:drift/drift.dart';

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

  // final int id;
  // final Preacher? author;

  // final String title;
  // final String? theme;
  // final String? mainText;
  // final String? notes;

  // //TODO colocar nonnullable e required depois de implementar a persistência
  // final DateTime createdAt;
  // final DateTime? updatedAt;

  // final bool isPublished;

  // final List<String> tags;