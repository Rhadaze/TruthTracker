import 'package:TruthTracker/features/event/domain/value_objects/event_type.dart';

enum EventTypeService implements EventType {
  saturdayMorning,
  wednesdayNight,
  sundayNight,
  prayerWeek,
  adventistYouth,
  retreat,
  
  @override
  String get label => switch (this) {
    EventTypeService.saturdayMorning => "Culto Sábado de Manhã",
    EventTypeService.wednesdayNight => "Culto Quarta à Noite",
    EventTypeService.sundayNight => "Culto Domingo à Noite",
    EventTypeService.prayerWeek => "Semana de Oração",
    EventTypeService.adventistYouth => "Jovens Adventistas",
    EventTypeService.retreat => "Retiro", 
  };
}
