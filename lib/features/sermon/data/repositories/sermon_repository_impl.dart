import 'package:TruthTracker/data/database/database.dart';
import 'package:TruthTracker/features/sermon/data/daos/sermon_dao.dart';
import 'package:TruthTracker/features/sermon/data/mappers/sermon_mapper.dart';
import 'package:TruthTracker/features/sermon/domain/entities/sermon.dart';
import 'package:TruthTracker/features/sermon/models/sermon_list_item.dart';
import 'package:TruthTracker/features/sermon/domain/repositories/sermon_repository.dart';

class SermonRepositoryImpl implements SermonRepository {
  final SermonDao _sermonDao;

  SermonRepositoryImpl(this._sermonDao);

  //========================
  //  Inserts and Updates
  //========================
  @override
  Future<int> insert(Sermon sermon) {
    final companion = SermonMapper.toCompanion(sermon);
    return _sermonDao.insert(companion);
  }

  @override
  Future<int> upsert(Sermon sermon) {
    final companion = SermonMapper.toCompanion(sermon);
    return _sermonDao.upsert(companion);
  }

  @override
  Future<bool> replace(Sermon sermon) {
    final data = SermonMapper.toData(sermon);
    return _sermonDao.replace(data);
  }

  @override
  Future<int> updateFields(int sermonId, SermonsCompanion changes) {
    return _sermonDao.updateFields(sermonId, changes);
  }

  //========================
  //       Deletes
  //========================
  @override
  Future<int> deleteById(int sermonId) {
    return _sermonDao.deleteById(sermonId);
  }

  //========================
  //  Getters and watchers
  //========================
  @override
  Future<Sermon?> getById(int sermonId) async {
    final sermonData = await _sermonDao.getById(sermonId);
    return sermonData == null ? null : SermonMapper.toDomain(sermonData);
  }

  @override
  Stream<Sermon?> watchById(int sermonId) {
    final sermonDataStream = _sermonDao.watchById(sermonId);

    return sermonDataStream.map((data) {
      if (data == null) return null;
      return SermonMapper.toDomain(data);
    });
  }

  @override
  Future<List<Sermon>> getAll({bool desc = false}) async {
    final sermonsData = await _sermonDao.getAll(desc: desc);
    return sermonsData.map(SermonMapper.toDomain).toList();
  }

  @override
  Stream<List<Sermon>> watchAll({bool desc = false}) {
    final sermonDataStream = _sermonDao.watchAll(desc: desc);
    final sermonsStream = sermonDataStream.map((data) {
      return data.map(SermonMapper.toDomain).toList();
    });
    return sermonsStream;
  }

  @override
  Future<List<SermonListItem>> getListItems() {
    return _sermonDao.getListItems();
  }

  //=====================================
  //  JOIN - SERMON X PREACHER (author)
  //=====================================
  @override
  Future<Sermon?> getByIdWithAuthor(int sermonId) async {
    final sermonData = await _sermonDao.getByIdWithAuthor(sermonId);
    return sermonData == null ? null : SermonMapper.fromJoinedRow(sermonData);
  }

  @override
  Stream<Sermon?> watchByIdWithAuthor(int sermonId) {
    final sermonData = _sermonDao.watchByIdWithAuthor(sermonId);
    final sermonStream = sermonData.map((data) {
      if (data == null) return null;
      return SermonMapper.fromJoinedRow(data);
    });
    return sermonStream;
  }

  @override
  Future<List<Sermon>> getAllWithAuthor({bool desc = false}) async {
    final sermonsData = await _sermonDao.getAllWithAuthor(desc: desc);
    return sermonsData.map(SermonMapper.fromJoinedRow).toList();
  }

  @override
  Stream<List<Sermon>> watchAllWithAuthor({bool desc = false}) {
    return _sermonDao.watchAllWithAuthor(desc: desc).map((data) {
      return data.map(SermonMapper.fromJoinedRow).toList();
    });
  }
}
