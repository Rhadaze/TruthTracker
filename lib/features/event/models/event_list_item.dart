import 'package:TruthTracker/features/event/domain/enums/event_category.dart';
import 'package:TruthTracker/features/event/domain/value_objects/event_type.dart';

class EventListItem {
  final int id;
  final DateTime date;

  final int venueId;
  final String venueName;

  final int preacherId;
  final String preacherName;

  final int? sermonId;
  final String? sermonTitle;

  final EventCategory? category;
  final EventType? type;

  const EventListItem({
    required this.id,
    required this.date,
    required this.venueId,
    required this.venueName,
    required this.preacherId,
    required this.preacherName,
    this.sermonId,
    this.sermonTitle,
    this.category,
    this.type,
  });
}
