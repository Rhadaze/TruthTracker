import 'package:TruthTracker/data/database/database.dart';
import 'package:TruthTracker/features/event/domain/entities/event.dart';

abstract class EventRepository {
  Future<int> insertEvent(EventsCompanion companion);

  Future<int> upsertEvent(EventsCompanion companion);

  Future<List<Event>> getAll({bool desc = true});

  Future<List<Event>> getAllByVenue(int venueId, {bool desc = true});

  Future<Event?> getById(int id);

  Future<List<Event>> searchByName(String query);

  Future<bool> updateEvent(Event event);

  Future<int> updateEventVenue({required int eventId, required int venueId});

  Future<int> deleteById(int id);

  Stream<List<Event>> watchByDate(DateTime selectedDate);

  Stream<List<Event>> watchByDateAndPreacher(
    // TODO arrumar date para não considerar hora e segundo
    DateTime selectedDate,
    int preacherId,
  );

  Stream<Event?> watchById(int id);
}
