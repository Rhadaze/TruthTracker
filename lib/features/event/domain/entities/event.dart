import 'package:TruthTracker/features/preached_at/domain/enums/event_type.dart';
import 'package:TruthTracker/features/preacher/data/preacher.dart';
import 'package:TruthTracker/features/sermon/data/sermon.dart';
import 'package:TruthTracker/features/church/data/church.dart';

class Event {
  EventType type;
  String place;
  DateTime? date;
  Sermon sermon;
  Preacher preacher;
  Church church;

  Event({
    required this.type,
    required this.place,
    this.date,
    required this.sermon,
    required this.preacher,
    required this.church,
  });
}
