import 'package:TruthTracker/features/event/domain/enums/event_type_service.dart';

extension EventTypeServiceExtension on EventTypeService {
  String get label {
    switch (this) {
      case EventTypeService.saturdayMorning:
        return "Sábado - Culto divino";
      case EventTypeService.sundayNight:
        return "Domingo a noite";
      case EventTypeService.wednesdayNight:
        return "Quarta - Culto de oração";
      case EventTypeService.prayerWeek:
        return "Semana de oração";
      case EventTypeService.adventistYouth:
        return "JA - Culto Jovem";
    }
  }
}
