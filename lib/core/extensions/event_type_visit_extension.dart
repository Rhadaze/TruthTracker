import 'package:TruthTracker/features/event/domain/enums/event_type_visit.dart';

extension EventTypeExtension on EventTypeVisit {
  String get label {
    switch (this) {
      case EventTypeVisit.astray: //TODO fazer duas dropdowns mais simples?
        return "Afastado";
      case EventTypeVisit.routine: //TODO fazer duas dropdowns mais simples?
        return "Rotina";
      case EventTypeVisit.sickness: //TODO fazer duas dropdowns mais simples?
        return "Doença";
      case EventTypeVisit.counseling: //TODO fazer duas dropdowns mais simples?
        return "Aconselhamento";
      case EventTypeVisit.mourning: //TODO fazer duas dropdowns mais simples?
        return "Luto";
    }
  }
}
