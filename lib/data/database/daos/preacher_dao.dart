import 'package:drift/drift.dart';

import '../../tables/preachers.dart';
import '../database.dart';

part 'preacher_dao.g.dart';

@DriftAccessor(tables: [Preachers])
class PreacherDao extends DatabaseAccessor<AppDatabase>
    with _$PreacherDaoMixin {
  PreacherDao(super.db);

  Future<int> insertPreacher(PreachersCompanion companion) {
    return into(preachers).insert(companion);
  }

  Future<int> upsertPreacher(PreachersCompanion companion) {
    return into(preachers).insertOnConflictUpdate(companion);
  }

  Future<PreacherData?> getById(int id) {
    return (select(preachers)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<List<PreacherData>> getAll({bool desc = false}) {
    final ordering = desc
        ? OrderingTerm.desc(preachers.name)
        : OrderingTerm.asc(preachers.name);

    return (select(preachers)..orderBy([(_) => ordering])).get();
  }

  Stream<List<PreacherData>> watchAll({bool desc = false}) {
    final ordering = desc
        ? OrderingTerm.desc(preachers.name)
        : OrderingTerm.asc(preachers.name);

    return (select(preachers)..orderBy([(_) => ordering])).watch();
  }

  Stream<PreacherData?> watchById(int id) {
    return (select(
      preachers,
    )..where((t) => t.id.equals(id))).watchSingleOrNull();
  }

  Future<List<PreacherData>> searchByName(String query) {
    //TODO preciso normalizar essa busca
    final q = query.trim();
    if (q.isEmpty) return Future.value([]);

    return (select(preachers)
          ..where((t) => t.name.like('%$q%'))
          ..orderBy([(t) => OrderingTerm.asc(t.name)]))
        .get();
  }

  Future<bool> updatePreacher(PreacherData preacher) {
    return update(preachers).replace(preacher);
  }

  Future<int> updateName({required int id, required String name}) {
    return (update(preachers)..where((t) => t.id.equals(id))).write(
      PreachersCompanion(name: Value(name)),
    );
  }

  Future<int> deleteById(int id) {
    return (delete(preachers)..where((t) => t.id.equals(id))).go();
  }
}
