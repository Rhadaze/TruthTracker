import 'package:TruthTracker/features/event/domain/enums/event_type_service.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type_talk.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type_teaching.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type_visit.dart';

import '../../features/event/domain/enums/event_category.dart';

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
