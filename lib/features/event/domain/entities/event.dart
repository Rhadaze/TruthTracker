import 'package:TruthTracker/features/event/domain/enums/event_type.dart';
import 'package:TruthTracker/features/preacher/domain/entities/preacher.dart';
import 'package:TruthTracker/features/sermon/domain/entities/sermon.dart';
import 'package:TruthTracker/features/church/domain/entities/church.dart';

class Event {
  EventType? type;
  String? place;
  DateTime date;
  Sermon? sermon;
  Preacher? preacher;
  Church church;

  Event({
    this.type,
    this.place,
    required this.date,
    this.sermon,
    this.preacher,
    required this.church,
  });
}
