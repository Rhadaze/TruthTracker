import 'package:TruthTracker/features/event/domain/enums/event_type_service.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type_talk.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type_teaching.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type_visit.dart';

import '../../features/event/domain/enums/event_type.dart';

extension EventTypeExtension on EventCategory {
  String get label {
    switch (this) {
      case EventCategory.service:
        return "Culto";
      case EventCategory.talk:
        return "Palestra";
      case EventCategory.teaching:
        return "Aula";
      case EventCategory.visit:
        return "Visita";
    }
  }

  List<Enum> get types {
    switch (this) {
      case EventCategory.service:
        return EventTypeService.values;
      case EventCategory.talk:
        return EventTypeTalk.values;
      case EventCategory.teaching:
        return EventTypeTeaching.values;
      case EventCategory.visit:
        return EventTypeVisit.values;
    }
  }
}

// import '../../features/event/domain/enums/event_type.dart';

// extension EventTypeExtension on EventType {
//   String get label {
//     switch (this) {
//       case EventType.saturdayMorning: //TODO fazer duas dropdowns mais simples?
//         return "Culto de Sábado";
//       case EventType.wednesdayNight:
//         return "Culto de Quarta";
//       case EventType.sundayNight:
//         return "Culto de Domingo";
//       case EventType.prayerWeek:
//         return "Semana de Oração";
//       case EventType.adventistYouth:
//         return "JA - Cultos dos jovens";
//       case EventType.talk:
//         return "Palestra";
//       case EventType.congress:
//         return "Congresso";
//       case EventType.teachingClass:
//         return "Aula";
//       case EventType.bibleStudy:
//         return "Estudo Bíblico";
//       case EventType.visit:
//         return "Visita";
//       // case EventType.service:
//       //   return "Culto";
//     }
//   }
// }
