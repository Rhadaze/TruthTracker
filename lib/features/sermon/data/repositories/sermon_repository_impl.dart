import 'package:TruthTracker/data/database/daos/preacher_dao.dart';
import 'package:TruthTracker/data/database/database.dart';
import 'package:TruthTracker/data/database/daos/sermon_dao.dart';
import 'package:TruthTracker/features/preacher/data/mappers/preacher_mapper.dart';
import 'package:TruthTracker/features/sermon/data/mappers/sermon_mapper.dart';
import 'package:TruthTracker/features/sermon/domain/entities/sermon.dart';
import 'package:TruthTracker/features/sermon/domain/repositories/sermon_repository.dart';

class SermonRepositoryImpl implements SermonRepository {
  final SermonDao _sermonDao;
  final PreacherDao _preacherDao;

  SermonRepositoryImpl(this._sermonDao, this._preacherDao);

  @override
  Future<int> insert(Sermon sermon) {
    final companion = SermonMapper.toCompanion(sermon);
    return _sermonDao.insertSermon(companion);
  }

  @override
  Future<int> upsert(Sermon sermon) {
    final companion = SermonMapper.toCompanion(sermon);
    return _sermonDao.upsertSermon(companion);
  }

  @override
  Future<int> update(Sermon sermon) {
    final companion = SermonMapper.toCompanion(sermon);
    final int id = sermon.id!;
    return _sermonDao.updateSermon(id, companion);
  }

  @override
  Future<bool> replace(Sermon sermon) {
    final data = SermonMapper.toData(sermon);
    return _sermonDao.replaceSermon(data);
  }

  @override
  Future<Sermon?> getById(int sermonId) async {
    final sermonData = await _sermonDao.getById(sermonId);
    return sermonData == null ? null : _buildDomainSermon(sermonData);
  }

  @override
  Stream<Sermon?> watchById(int sermonId) {
    final sermonDataStream = _sermonDao.watchById(sermonId);
    return sermonDataStream.asyncMap((sermonData) {
      if (sermonData == null) return null;
      return _buildDomainSermon(sermonData);
    });
  }

  @override
  Future<List<Sermon>> getAll({bool desc = false}) async {
    final List<SermonData> sermonsData = await _sermonDao.getAll(desc: desc);

    return Future.wait(sermonsData.map(_buildDomainSermon));
  }

  @override
  Stream<List<Sermon>> watchAll({bool desc = false}) {
    final sermonDataStream = _sermonDao.watchAll(desc: desc);
    final Stream<List<Sermon>> sermonStream;

    sermonStream = sermonDataStream.asyncMap((sermonsData) {
      return Future.wait(sermonsData.map(_buildDomainSermon));
    });
    return sermonStream;
  }

  Future<Sermon> _buildDomainSermon(SermonData data) async {
    final authorData = data.authorId != null
        ? await _preacherDao.getById(data.authorId!)
        : null;

    return Sermon(
      id: data.id,
      title: data.title,
      theme: data.theme,
      mainText: data.mainText,
      notes: data.notes,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
      isPublished: data.isPublished,
      author: authorData != null ? PreacherMapper.toDomain(authorData) : null,
    );
  }

  @override
  Future<int> deleteById(int sermonId) {
    return _sermonDao.deleteById(sermonId);
  }
}
