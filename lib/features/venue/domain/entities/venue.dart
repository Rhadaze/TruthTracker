import 'package:TruthTracker/features/venue/domain/enums/venue_type.dart';

class Venue {
  final int? id;
  final String name;
  final String country;
  final String state;
  final String city;
  final String? neighborhood;
  final String denomination;
  final VenueType type;

  Venue({
    this.id,
    required this.name,
    required this.country,
    required this.state,
    required this.city,
    this.neighborhood,
    required this.denomination,
    required this.type,
  });
}
