import 'package:TruthTracker/features/event/domain/value_objects/event_type.dart';

enum EventTypeTeaching implements EventType {
  churchClass,
  bibleStudy,
  university;

  @override
  String get label => switch (this) {
    EventTypeTeaching.bibleStudy => "Estudo bíblico",
    EventTypeTeaching.churchClass => "Classe bíblica",
    EventTypeTeaching.university => "Universidade",
  };
}
