import 'package:TruthTracker/data/database/database.dart';
import 'package:TruthTracker/features/event/data/rows/event_complete_row.dart';
import 'package:TruthTracker/features/event/domain/entities/event.dart';
import 'package:TruthTracker/features/event/domain/enums/event_category.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type_service.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type_talk.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type_teaching.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type_visit.dart';
import 'package:TruthTracker/features/event/domain/value_objects/event_type.dart';
import 'package:TruthTracker/features/event/models/event_list_item.dart';
import 'package:TruthTracker/features/preacher/data/mappers/preacher_mapper.dart';
import 'package:TruthTracker/features/sermon/data/mappers/sermon_mapper.dart';
import 'package:TruthTracker/features/venue/data/mappers/venue_mapper.dart';
import 'package:drift/drift.dart';

class EventMapper {
  static Event toDomain(EventCompleteRow row) {
    final p = PreacherMapper.toDomain(row.preacherData);
    final v = VenueMapper.toDomain(row.venueData);
    final s = row.sermonData == null
        ? null
        : SermonMapper.toDomain(row.sermonData!);

    final category = row.eventData.category == null
        ? null
        : EventCategory.values.byName(row.eventData.category!);

    final type = typeFromString(row.eventData.type, category);

    return Event(
      id: row.eventData.id,
      category: category,
      type: type,
      date: row.eventData.date,
      venue: v,
      preacher: p,
      sermon: s,
    );
  }

  static EventsCompanion toCompanion(Event event) {
    if (event.preacher.id == null) {
      throw ArgumentError(
        'Cannot convert Event to EventsCompanion. No preacher_ID found.',
      );
    }
    if (event.venue.id == null) {
      throw ArgumentError(
        'Cannot convert Event to EventsCompanion. No venue_ID found.',
      );
    }
    if (event.sermon != null && event.sermon!.id == null) {
      throw ArgumentError(
        'Cannot convert Event to EventsCompanion. Sermon exists but has no ID.',
      );
    }

    return EventsCompanion(
      id: event.id == null ? const Value.absent() : Value(event.id!),
      date: Value(event.date),
      category: Value(event.category?.name),
      type: Value(typeToString(event.type)),
      sermonId: Value(event.sermon?.id),
      venueId: Value(event.venue.id!),
      preacherId: Value(event.preacher.id!),
    );
  }

  static EventData toData(Event event) {
    if (event.id == null) {
      throw (ArgumentError("Cannot convert Event to EventData. No ID found."));
    }
    if (event.preacher.id == null) {
      throw (ArgumentError(
        "Cannot convert Event to EventData. No preacher_ID found.",
      ));
    }
    if (event.venue.id == null) {
      throw (ArgumentError(
        "Cannot convert Event to EventData. No venue_ID found.",
      ));
    }
    if (event.sermon != null && event.sermon?.id == null) {
      throw (ArgumentError(
        "Cannot convert Event to EventData. Sermon exists but has no ID.",
      ));
    }
    return EventData(
      id: event.id!,
      date: event.date,
      category: event.category?.name,
      type: typeToString(event.type),
      preacherId: event.preacher.id!,
      venueId: event.venue.id!,
      sermonId: event.sermon?.id,
    );
  }

  static EventListItem toListItem(EventCompleteRow row) {
    final category = row.eventData.category == null
        ? null
        : EventCategory.values.byName(row.eventData.category!);

    final type = typeFromString(row.eventData.type, category);

    return EventListItem(
      id: row.eventData.id,
      date: row.eventData.date,
      category: category,
      type: type,
      venueId: row.venueData.id,
      venueName: row.venueData.name,
      preacherId: row.preacherData.id,
      preacherName: row.preacherData.name,
      sermonId: row.sermonData?.id,
      sermonTitle: row.sermonData?.title,
    );
  }

  //========================
  //        Helpers
  //========================
  static String? typeToString(EventType? type) {
    return switch (type) {
      null => null,
      EventTypeService t => t.name,
      EventTypeTalk t => t.name,
      EventTypeTeaching t => t.name,
      EventTypeVisit t => t.name,
      _ => throw UnsupportedError('Unsupported EventType: $type'),
    };
  }

  //TODO estudar isso aqui depois.
  static EventType? typeFromString(String? rawType, EventCategory? category) {
    if (rawType == null || category == null) {
      return null;
    }

    return switch (category) {
      EventCategory.service => EventTypeService.values.byName(rawType),
      EventCategory.talk => EventTypeTalk.values.byName(rawType),
      EventCategory.teaching => EventTypeTeaching.values.byName(rawType),
      EventCategory.visit => EventTypeVisit.values.byName(rawType),
    };
  }
}
