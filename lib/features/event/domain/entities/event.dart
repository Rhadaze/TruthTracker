import 'package:TruthTracker/features/event/domain/enums/event_type.dart';
import 'package:TruthTracker/features/preacher/domain/entities/preacher.dart';
import 'package:TruthTracker/features/sermon/domain/entities/sermon.dart';
import 'package:TruthTracker/features/church/domain/entities/church.dart';

class Event {
  final EventType? category;
  final Enum? subtype;
  final String? place;
  final DateTime date;
  final Sermon? sermon;
  final Preacher? preacher;
  final Church church;

  Event({
    this.category,
    this.subtype,
    this.place,
    required this.date,
    this.sermon,
    this.preacher,
    required this.church,
  });
}
