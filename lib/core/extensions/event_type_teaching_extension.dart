import 'package:TruthTracker/features/event/domain/enums/event_type_teaching.dart';

extension EventTypeExtension on EventTypeTeaching {
  String get label {
    switch (this) {
      case EventTypeTeaching.bibleStudy:
        return "Estudo bíblico";
      case EventTypeTeaching.churchClass:
        return "Classe bíblica";
      case EventTypeTeaching.university:
        return "Universidade";
    }
  }
}
