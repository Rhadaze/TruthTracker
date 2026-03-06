import 'package:drift/drift.dart';

import '../tables/preacher_table.dart';
import 'database.dart';

part 'preacher_dao.g.dart';

@DriftAccessor(tables: [PreacherTable])
class PreacherDao extends DatabaseAccessor<AppDatabase>
    with _$PreacherDaoMixin {
  PreacherDao(super.db);

  Future<int> insertPreacher(PreacherTableCompanion companion) {
    return into(preacherTable).insert(companion);
  }

  Future<int> upsertPreacher(PreacherTableCompanion companion) {
    return into(preacherTable).insertOnConflictUpdate(companion);
  }

  Future<PreacherTableData?> getById(int id) {
    return (select(
      preacherTable,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<List<PreacherTableData>> getAllOrderedByName() {
    return (select(
      preacherTable,
    )..orderBy([(t) => OrderingTerm.asc(t.name)])).get();
  }

  Stream<List<PreacherTableData>> watchAllOrderedByName() {
    return (select(
      preacherTable,
    )..orderBy([(t) => OrderingTerm.asc(t.name)])).watch();
  }

  Stream<PreacherTableData?> watchById(int id) {
    return (select(
      preacherTable,
    )..where((t) => t.id.equals(id))).watchSingleOrNull();
  }

  Future<List<PreacherTableData>> searchByName(String query) {
    //TODO preciso normalizar essa busca
    final q = query.trim();
    if (q.isEmpty) return Future.value([]);

    return (select(preacherTable)
          ..where((t) => t.name.like('%$q%'))
          ..orderBy([(t) => OrderingTerm.asc(t.name)]))
        .get();
  }

  Future<bool> updatePreacher(PreacherTableData preacher) {
    return update(preacherTable).replace(preacher);
  }

  Future<int> updateName({required int id, required String name}) {
    return (update(preacherTable)..where((t) => t.id.equals(id))).write(
      PreacherTableCompanion(name: Value(name)),
    );
  }

  Future<int> deleteById(int id) {
    return (delete(preacherTable)..where((t) => t.id.equals(id))).go();
  }
}
