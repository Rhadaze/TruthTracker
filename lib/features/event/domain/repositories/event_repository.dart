import 'package:TruthTracker/features/event/domain/entities/event.dart';
import 'package:TruthTracker/features/event/models/event_list_item.dart';

abstract class EventRepository {
  Future<int> insert(Event event);
  Future<int> upsert(Event event);
  Future<bool> replace(Event event);
  Future<int> deleteById(int id);

  Future<Event?> getById(int id);
  Stream<Event?> watchById(int id);

  Future<List<EventListItem>> getListItems({
    DateTime? date,
    int? venueId,
    int? preacherId,
    int? sermonId,
    bool desc = true,
  });
  Stream<List<EventListItem>> watchListItems({
    DateTime? date,
    int? venueId,
    int? preacherId,
    int? sermonId,
    bool desc = true,
  });
}
