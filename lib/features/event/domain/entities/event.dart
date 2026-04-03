import 'package:TruthTracker/features/event/domain/enums/event_category.dart';
import 'package:TruthTracker/features/event/domain/value_objects/event_type.dart';
import 'package:TruthTracker/features/preacher/domain/entities/preacher.dart';
import 'package:TruthTracker/features/sermon/domain/entities/sermon.dart';
import 'package:TruthTracker/features/venue/domain/entities/venue.dart';

class Event {
  final int? id;
  final EventCategory? category;
  final EventType? type;
  final DateTime date;
  final Venue venue;
  final Preacher preacher;
  final Sermon? sermon;

Event({
    required this.id,
    this.category,
    this.type,
    required this.date,
    required this.preacher,
    required this.venue,
    this.sermon,
  }) {
    if (type != null && category == null) {
      throw ArgumentError('An Event with type must also define a category.');
    }

    if (type != null && !category!.types.contains(type)) {
      throw ArgumentError(
        'The selected type does not belong to the selected category.',
      );
    }
  }
}
