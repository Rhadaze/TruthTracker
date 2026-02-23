import '../../features/event/domain/enums/event_type.dart';

extension EventTypeExtension on EventType {
  String get label {
    switch (this) {
      case EventType.service:
        return "Culto";
      case EventType.talk:
        return "Palestra";
      case EventType.teaching:
        return "Aula";
      case EventType.visit:
        return "Visita";
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
