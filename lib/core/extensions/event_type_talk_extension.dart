import 'package:TruthTracker/features/event/domain/enums/event_type_talk.dart';

extension EventTypeExtension on EventTypeTalk {
  String get label {
    switch (this) {
      case EventTypeTalk.congress:
        return "Congresso";
    }
  }
}
