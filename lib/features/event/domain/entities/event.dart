import 'package:TruthTracker/features/event/domain/enums/event_category.dart';
import 'package:TruthTracker/features/event/domain/value_objects/event_type.dart';
import 'package:TruthTracker/features/preacher/domain/entities/preacher.dart';
import 'package:TruthTracker/features/sermon/domain/entities/sermon.dart';
import 'package:TruthTracker/features/venue/domain/entities/venue.dart';

class Event {
  final int id;
  final EventCategory? category;
  final EventType? type;
  final Venue venue;
  final DateTime date;
  final Sermon? sermon;
  final Preacher preacher;

  Event({
    this.id,
    this.category,
    this.type,
    required this.date,
    this.sermon,
    required this.preacher,
    required this.venue,
  });
}
