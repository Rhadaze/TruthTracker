import 'package:TruthTracker/features/preacher/data/daos/preacher_dao.dart';
import 'package:TruthTracker/features/preacher/data/mappers/preacher_mapper.dart';
import 'package:TruthTracker/features/preacher/domain/entities/preacher.dart';
import 'package:TruthTracker/features/preacher/domain/repositories/preacher_repository.dart';
import 'package:TruthTracker/features/preacher/models/preacher_list_item.dart';

class PreacherRepositoryImpl implements PreacherRepository {
  final PreacherDao preacherDao;

  PreacherRepositoryImpl(this.preacherDao);

  //========================
  //  Inserts and Updates
  //========================
  @override
  Future<int> insert(Preacher preacher) {
    final companion = PreacherMapper.toCompanion(preacher);
    return preacherDao.insert(companion);
  }

  @override
  Future<int> upsert(Preacher preacher) {
    final companion = PreacherMapper.toCompanion(preacher);
    return preacherDao.upsert(companion);
  }

  @override
  Future<bool> replace(Preacher preacher) {
    final data = PreacherMapper.toData(preacher);
    return preacherDao.replace(data);
  }

  //========================
  //       Deletes
  //========================

  @override
  Future<int> deleteById(int id) {
    return preacherDao.deleteById(id);
  }

  //========================
  //  Getters and watchers
  //========================
  @override
  Future<Preacher?> getById(int id) async {
    final preacherData = await preacherDao.getById(id);
    return preacherData == null ? null : PreacherMapper.toDomain(preacherData);
  }

  @override
  Stream<Preacher?> watchById(int id) {
    final preacherDataStream = preacherDao.watchById(id);
    return preacherDataStream.map((data) {
      if (data == null) return null;
      return PreacherMapper.toDomain(data);
    });
  }

  @override
  Future<List<Preacher>> getAll({bool desc = false}) async {
    final preachersData = await preacherDao.getAll(desc: desc);
    return preachersData.map(PreacherMapper.toDomain).toList();
  }

  @override
  Stream<List<Preacher>> watchAll({bool desc = false}) {
    final preachersDataStream = preacherDao.watchAll(desc: desc);
    final preacherStream = preachersDataStream.map((lista) {
      return lista.map(PreacherMapper.toDomain).toList();
    });
    return preacherStream;
  }

  @override
  Future<List<PreacherListItem>> getListItems({bool desc = false}) {
    return preacherDao.getListItems(desc: desc);
  }

  @override
  Future<List<PreacherListItem>> searchListItems({
    required String search,
    bool desc = false,
  }) {
    return preacherDao.searchListItems(search: search, desc: desc);
  }

  //========================
  //        Helpers
  //========================
}
