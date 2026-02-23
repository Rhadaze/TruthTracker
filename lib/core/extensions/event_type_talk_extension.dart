import 'package:TruthTracker/features/event/domain/enums/event_type_talk.dart';

extension EventTypeTalkExtension on EventTypeTalk {
  String get label {
    switch (this) {
      case EventTypeTalk.congress:
        return "Congresso";
    }
  }
}
