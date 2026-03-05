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
}
