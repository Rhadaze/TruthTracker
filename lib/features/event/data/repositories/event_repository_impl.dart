import 'package:TruthTracker/features/event/data/daos/event_dao.dart';
import 'package:TruthTracker/features/event/data/mappers/event_mapper.dart';
import 'package:TruthTracker/features/event/domain/entities/event.dart';
import 'package:TruthTracker/features/event/domain/repositories/event_repository.dart';
import 'package:TruthTracker/features/event/models/event_list_item.dart';

class EventRepositoryImpl implements EventRepository {
  final EventDao _eventDao;

  EventRepositoryImpl(this._eventDao);

  //========================
  //  Inserts and Updates
  //========================
  @override
  Future<int> insert(Event event) {
    final companion = EventMapper.toCompanion(event);
    return _eventDao.insert(companion);
  }

  @override
  Future<int> upsert(Event event) {
    final companion = EventMapper.toCompanion(event);
    return _eventDao.upsert(companion);
  }

  @override
  Future<bool> replace(Event event) {
    final data = EventMapper.toData(event);
    return _eventDao.replace(data);
  }

  //========================
  //       Deletes
  //========================
  @override
  Future<int> deleteById(int id) {
    return _eventDao.deleteById(id);
  }

  //========================
  //  Getters and watchers
  //========================
  @override
  Future<Event?> getById(int id) async {
    final completeEventData = await _eventDao.getById(id);
    return completeEventData == null
        ? null
        : EventMapper.toDomain(completeEventData);
  }

  @override
  Stream<Event?> watchById(int id) {
    final completeEventStream = _eventDao.watchById(id);
    return completeEventStream.map((event) {
      return event == null ? null : EventMapper.toDomain(event);
    });
  }

  @override
  Future<List<EventListItem>> getListItems({
    DateTime? date,
    int? preacherId,
    int? venueId,
    int? sermonId,
    bool desc = true,
  }) async {
    final eventListItemsData = await _eventDao.getListItems(
      date: date,
      preacherId: preacherId,
      venueId: venueId,
      sermonId: sermonId,
      desc: desc,
    );

    return eventListItemsData.map(EventMapper.toListItem).toList();
  }

  @override
  Stream<List<EventListItem>> watchListItems({
    DateTime? date,
    int? venueId,
    int? preacherId,
    int? sermonId,
    bool desc = true,
  }) {
    final eventListItemsStream = _eventDao.watchListItems(
      date: date,
      preacherId: preacherId,
      venueId: venueId,
      sermonId: sermonId,
      desc: desc,
    );

    return eventListItemsStream.map(
      (list) => list.map(EventMapper.toListItem).toList(),
    );
  }

  //========================
  //        Helpers
  //========================
}
