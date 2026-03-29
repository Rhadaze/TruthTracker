import 'package:TruthTracker/features/preacher/domain/entities/preacher.dart';
import 'package:TruthTracker/features/preacher/models/preacher_list_item.dart';

abstract class PreacherRepository {
  Future<int> insert(Preacher preacher);
  Future<int> upsert(Preacher preacher);
  Future<bool> replace(Preacher preacher);
  Future<int> deleteById(int id);

  Future<Preacher?> getById(int id);
  Stream<Preacher?> watchById(int id);

  Future<List<Preacher>> getAll({bool desc = false});
  Stream<List<Preacher>> watchAll({bool desc = false});

  Future<List<PreacherListItem>> getListItems({bool desc = false});
  Future<List<PreacherListItem>> searchListItems({
    required String search,
    bool desc = false,
  });
}
