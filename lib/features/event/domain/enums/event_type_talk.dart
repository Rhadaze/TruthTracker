import 'package:TruthTracker/features/event/domain/value_objects/event_type.dart';

enum EventTypeTalk implements EventType {
  congress;

  String get label => switch (this) {
    EventTypeTalk.congress => "Congresso",
  };
}
