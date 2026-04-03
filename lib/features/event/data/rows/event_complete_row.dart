import 'package:TruthTracker/data/database/database.dart';

class EventCompleteRow {
  final EventData eventData;
  final PreacherData preacherData;
  final VenueData venueData;
  final SermonData? sermonData;

  EventCompleteRow({
    required this.eventData,
    required this.preacherData,
    required this.venueData,
    this.sermonData,
  });
}
