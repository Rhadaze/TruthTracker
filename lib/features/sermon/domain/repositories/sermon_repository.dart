import 'package:TruthTracker/data/database/database.dart';
import 'package:TruthTracker/features/sermon/domain/entities/sermon.dart';
import 'package:TruthTracker/features/sermon/models/sermon_list_item.dart';

abstract class SermonRepository {
  Future<int> insert(Sermon sermon);
  Future<int> upsert(Sermon sermon);
  Future<bool> replace(Sermon sermon);
  Future<int> updateFields(int sermonId, SermonsCompanion changes);
  Future<int> deleteById(int id);

  Future<Sermon?> getById(int id);
  Stream<Sermon?> watchById(int id);

  Future<List<SermonListItem>> getListItems();

  Future<List<Sermon>> getAll({bool desc = false});
  Stream<List<Sermon>> watchAll({bool desc = false});

  Future<Sermon?> getByIdWithAuthor(int sermonId);
  Stream<Sermon?> watchByIdWithAuthor(int sermonId);

  Future<List<Sermon>> getAllWithAuthor({bool desc = false});
  Stream<List<Sermon>> watchAllWithAuthor({bool desc = false});
}
