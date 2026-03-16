import 'package:TruthTracker/data/database/database.dart';
import 'package:TruthTracker/data/tables/sermons.dart';
import 'package:drift/drift.dart';

part 'sermon_dao.g.dart';

@DriftAccessor(tables: [Sermons])
class SermonDao extends DatabaseAccessor<AppDatabase> with _$SermonDaoMixin {
  SermonDao(super.db);

  Future<int> insertSermon(SermonsCompanion companion) {
    return into(sermons).insert(companion);
  }

  Future<int> upsertSermon(SermonsCompanion companion) {
    return into(sermons).insertOnConflictUpdate(companion);
  }

  Future<bool> replaceSermon(SermonData sermonData) {
    return update(sermons).replace(sermonData);
  }

  Future<int> updateSermon(int id, SermonsCompanion companion) {
    return (update(sermons)..where((t) => t.id.equals(id))).write(companion);
  }

  Future<SermonData?> getById(int sermonId) {
    return (select(
      sermons,
    )..where((t) => t.id.equals(sermonId))).getSingleOrNull();
  }

  Future<List<SermonData>> getAll({bool desc = false}) {
    final ordering = desc
        ? OrderingTerm.desc(sermons.title)
        : OrderingTerm.asc(sermons.title);

    return (select(sermons)..orderBy([(_) => ordering])).get();
  }

  Stream<List<SermonData>> watchAll({bool desc = false}) {
    final ordering = desc
        ? OrderingTerm.desc(sermons.title)
        : OrderingTerm.asc(sermons.title);

    return (select(sermons)..orderBy([(_) => ordering])).watch();
  }

  Stream<SermonData?> watchById(int sermonId) {
    return (select(
      sermons,
    )..where((t) => t.id.equals(sermonId))).watchSingleOrNull();
  }

  Future<int> deleteById(int sermonId) {
    return (delete(sermons)..where((t) => t.id.equals(sermonId))).go();
  }
}
