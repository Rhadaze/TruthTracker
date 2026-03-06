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

  Future<bool> updateSermon(Sermon sermon) {
    return update(sermons).replace(sermon);
  }

  Future<Sermon?> getById(int sermonId) {
    return (select(
      sermons,
    )..where((t) => t.id.equals(sermonId))).getSingleOrNull();
  }

  Future<List<Sermon>> getAll({bool desc = false}) {
    final ordering = desc
        ? OrderingTerm.desc(sermons.title)
        : OrderingTerm.asc(sermons.title);

    return (select(sermons)..orderBy([(_) => ordering])).get();
  }

  Stream<List<Sermon>> watchAll({bool desc = false}) {
    final ordering = desc
        ? OrderingTerm.desc(sermons.title)
        : OrderingTerm.asc(sermons.title);

    return (select(sermons)..orderBy([(_) => ordering])).watch();
  }

  Stream<Sermon?> watchById(int sermonId) {
    return (select(
      sermons,
    )..where((t) => t.id.equals(sermonId))).watchSingleOrNull();
  }

  Future<int> deleteById(int sermonId) {
    return (delete(sermons)..where((t) => t.id.equals(sermonId))).go();
  }
}
