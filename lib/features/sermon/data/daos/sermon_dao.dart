import 'package:TruthTracker/data/database/database.dart';
import 'package:TruthTracker/data/tables/preachers.dart';
import 'package:TruthTracker/data/tables/sermons.dart';
import 'package:TruthTracker/features/sermon/data/rows/sermon_with_author_row.dart';
import 'package:TruthTracker/features/sermon/models/sermon_list_item.dart';
import 'package:drift/drift.dart';

part 'sermon_dao.g.dart';

@DriftAccessor(tables: [Sermons, Preachers])
class SermonDao extends DatabaseAccessor<AppDatabase> with _$SermonDaoMixin {
  SermonDao(super.db);

  //========================
  //  Inserts and Updates
  //========================
  Future<int> insert(SermonsCompanion companion) {
    return into(sermons).insert(companion);
  }

  Future<int> upsert(SermonsCompanion companion) {
    return into(sermons).insertOnConflictUpdate(companion);
  }

  Future<bool> replace(SermonData sermonData) {
    return update(sermons).replace(sermonData);
  }

  Future<int> updateFields(int sermonId, SermonsCompanion companion) {
    return (update(
      sermons,
    )..where((t) => t.id.equals(sermonId))).write(companion);
  }

  //========================
  //       Deletes
  //========================
  Future<int> deleteById(int sermonId) {
    return (delete(sermons)..where((t) => t.id.equals(sermonId))).go();
  }

  //========================
  //  Getters and watchers
  //========================
  Future<SermonData?> getById(int sermonId) {
    return (select(
      sermons,
    )..where((t) => t.id.equals(sermonId))).getSingleOrNull();
  }

  Stream<SermonData?> watchById(int sermonId) {
    return (select(
      sermons,
    )..where((t) => t.id.equals(sermonId))).watchSingleOrNull();
  }

  Future<List<SermonListItem>> getListItems() async {
    final query = selectOnly(sermons)
      ..addColumns([sermons.id, sermons.title])
      ..orderBy([_titleOrdering(false)]);

    final rows = await query.get();

    return rows.map((row) {
      return SermonListItem(
        row.read(sermons.id)!,
        row.read(sermons.title)!,
      );
    }).toList();
  }

  Future<List<SermonData>> getAll({bool desc = false}) {
    return (select(sermons)..orderBy([(_) => _titleOrdering(desc)])).get();
  }

  Stream<List<SermonData>> watchAll({bool desc = false}) {
    return (select(sermons)..orderBy([(_) => _titleOrdering(desc)])).watch();
  }

  //=====================================
  //  JOIN - SERMON X PREACHER (author)
  //=====================================
  Future<SermonWithAuthorRow?> getByIdWithAuthor(int sermonId) async {
    final query = select(sermons).join([
      leftOuterJoin(preachers, preachers.id.equalsExp(sermons.authorId)),
    ])..where(sermons.id.equals(sermonId));

    final row = await query.getSingleOrNull();
    return row == null ? null : _mapJoinedRow(row);
  }

  Stream<SermonWithAuthorRow?> watchByIdWithAuthor(int sermonId) {
    final query = select(sermons).join([
      leftOuterJoin(preachers, preachers.id.equalsExp(sermons.authorId)),
    ])..where(sermons.id.equals(sermonId));

    return query.watchSingleOrNull().map((row) {
      return row == null ? null : _mapJoinedRow(row);
    });
  }

  Future<List<SermonWithAuthorRow>> getAllWithAuthor({
    bool desc = false,
  }) async {
    final query =
        select(sermons).join([
          leftOuterJoin(preachers, preachers.id.equalsExp(sermons.authorId)),
        ])..orderBy([
          OrderingTerm(
            expression: sermons.title,
            mode: desc ? OrderingMode.desc : OrderingMode.asc,
          ),
        ]);

    final rows = await query.get();

    return rows.map(_mapJoinedRow).toList();
  }

  Stream<List<SermonWithAuthorRow>> watchAllWithAuthor({bool desc = false}) {
    final query =
        select(sermons).join([
          leftOuterJoin(preachers, preachers.id.equalsExp(sermons.authorId)),
        ])..orderBy([
          OrderingTerm(
            expression: sermons.title,
            mode: desc ? OrderingMode.desc : OrderingMode.asc,
          ),
        ]);

    return query.watch().map((rows) {
      return rows.map(_mapJoinedRow).toList();
    });
  }

  OrderingTerm _titleOrdering(bool desc) {
    return desc
        ? OrderingTerm.desc(sermons.title)
        : OrderingTerm.asc(sermons.title);
  }

  SermonWithAuthorRow _mapJoinedRow(TypedResult row) {
    return SermonWithAuthorRow(
      row.readTable(sermons),
      row.readTableOrNull(preachers),
    );
  }
}
