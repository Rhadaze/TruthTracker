import 'package:TruthTracker/features/event/domain/enums/event_type_visit.dart';

extension EventTypeVisitExtension on EventTypeVisit {
  String get label {
    switch (this) {
      case EventTypeVisit.routine:
        return "Rotina";
      case EventTypeVisit.counseling:
        return "Aconselhamento";
      case EventTypeVisit.astray:
        return "Afastado";
      case EventTypeVisit.sickness:
        return "Doença";
      case EventTypeVisit.mourning:
        return "Luto";
    }
  }
}
