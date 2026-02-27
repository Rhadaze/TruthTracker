import 'package:TruthTracker/features/event/domain/enums/event_type_service.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type_talk.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type_teaching.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type_visit.dart';
import 'package:TruthTracker/features/event/domain/value_objects/event_type.dart';

enum EventCategory {
  service,
  talk,
  teaching,
  visit;

  String get label => switch (this) {
    EventCategory.service => "Culto",
    EventCategory.talk => "Palestra",
    EventCategory.teaching => "Aula",
    EventCategory.visit => "Visita",
  };

  List<EventType> get types => switch (this) {
    EventCategory.service => EventTypeService.values,
    EventCategory.talk => EventTypeTalk.values,
    EventCategory.teaching => EventTypeTeaching.values,
    EventCategory.visit => EventTypeVisit.values,
  };
}
