import 'package:TruthTracker/features/sermon/domain/entities/sermon.dart';

abstract class SermonRepository {
  Future<int> insert(Sermon sermon);
  Future<int> upsert(Sermon sermon);
  Future<int> update(Sermon sermon);
  Future<bool> replace(Sermon sermon);

  Future<Sermon?> getById(int sermonId);
  Future<List<Sermon>> getAll({bool desc = false});

  Stream<List<Sermon>> watchAll({bool desc = false});
  Stream<Sermon?> watchById(int id);

  Future<int> deleteById(int id);
}
