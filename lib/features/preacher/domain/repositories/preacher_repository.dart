import 'package:TruthTracker/data/database/database.dart';
import 'package:TruthTracker/features/preacher/domain/entities/preacher.dart';

abstract class PreacherRepository {
  Future<int> insertPreacher(PreachersCompanion companion);

  Future<int> upsertPreacher(PreachersCompanion companion);

  Future<Preacher?> getById(int id);

  Future<List<Preacher>> getAll({bool desc = false});

  Stream<List<Preacher>> watchAll({bool desc = false});

  Stream<Preacher?> watchById(int id);

  Future<List<Preacher>> searchByName(String query);

  Future<bool> updatePreacher(Preacher preacher);

  Future<int> updateName({required int id, required String name});

  Future<int> deleteById(int id);
}
