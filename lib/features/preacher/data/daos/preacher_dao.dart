import 'package:TruthTracker/features/preacher/models/preacher_list_item.dart';
import 'package:drift/drift.dart';

import '../../../../data/tables/preachers.dart';
import '../../../../data/database/database.dart';

part 'preacher_dao.g.dart';

@DriftAccessor(tables: [Preachers])
class PreacherDao extends DatabaseAccessor<AppDatabase>
    with _$PreacherDaoMixin {
  PreacherDao(super.db);

  //========================
  //  Inserts and Updates
  //========================
  Future<int> insert(PreachersCompanion companion) {
    return into(preachers).insert(companion);
  }

  Future<int> upsert(PreachersCompanion companion) {
    return into(preachers).insertOnConflictUpdate(companion);
  }

  Future<bool> replace(PreacherData data) {
    return update(preachers).replace(data);
  }

  //========================
  //       Deletes
  //========================
  Future<int> deleteById(int id) {
    return (delete(preachers)..where((t) => t.id.equals(id))).go();
  }

  //========================
  //  Getters and watchers
  //========================
  Future<PreacherData?> getById(int id) {
    return (select(preachers)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Stream<PreacherData?> watchById(int id) {
    return (select(
      preachers,
    )..where((t) => t.id.equals(id))).watchSingleOrNull();
  }

  Future<List<PreacherData>> getAll({bool desc = false}) {
    return (select(preachers)..orderBy([(_) => _nameOrdering(desc)])).get();
  }

  Stream<List<PreacherData>> watchAll({bool desc = false}) {
    return (select(preachers)..orderBy([(_) => _nameOrdering(desc)])).watch();
  }

  Future<List<PreacherListItem>> getListItems({bool desc = false}) async {
    final query = selectOnly(preachers)
      ..addColumns([preachers.id, preachers.name])
      ..orderBy([_nameOrdering(desc)]);

    final rows = await query.get();
    return rows.map((row) {
      return PreacherListItem(
        row.read(preachers.id)!,
        row.read(preachers.name)!,
      );
    }).toList();
  }

  Future<List<PreacherListItem>> searchListItems({
    required String search,
    bool desc = false,
  }) async {
    final s = search.trim();
    if (s.isEmpty) {
      return [];
    }

    final query = selectOnly(preachers)
      ..addColumns([preachers.id, preachers.name])
      ..where(preachers.name.like('%$s%'))
      ..orderBy([_nameOrdering(desc)]);

    final rows = await query.get();
    return rows.map((row) {
      return PreacherListItem(
        row.read(preachers.id)!,
        row.read(preachers.name)!,
      );
    }).toList();
  }

  //========================
  //        Helpers
  //========================
  OrderingTerm _nameOrdering([bool desc = false]) {
    return desc
        ? OrderingTerm.desc(preachers.name)
        : OrderingTerm.asc(preachers.name);
  }
}
