import 'package:TruthTracker/features/event/domain/value_objects/event_type.dart';

enum EventTypeVisit implements EventType {
  astray,
  sickness,
  routine,
  counseling,
  mourning;

  @override
  String get label => switch (this) {
    EventTypeVisit.routine => "Rotina",
    EventTypeVisit.counseling => "Aconselhamento",
    EventTypeVisit.astray => "Afastado",
    EventTypeVisit.sickness => "Doença",
    EventTypeVisit.mourning => "Luto",
  };
}
