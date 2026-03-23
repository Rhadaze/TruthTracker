import 'package:TruthTracker/data/database/database.dart';
import 'package:TruthTracker/features/venue/domain/entities/venue.dart';
import 'package:TruthTracker/features/venue/domain/enums/venue_type.dart';
import 'package:drift/drift.dart';

class VenueMapper {
  static Venue toDomain(VenueData data) {
    return Venue(
      id: data.id,
      name: data.name,
      country: data.country,
      state: data.state,
      city: data.city,
      neighborhood: data.neighborhood,
      denomination: data.denomination,
      type: VenueType.values.byName(data.type),
    );
  }

  static VenueData toData(Venue venue) {
    if (venue.id == null) {
      throw ArgumentError("Cannot convert to VenueData. ID is null.");
    }
    return VenueData(
      id: venue.id!,
      name: venue.name,
      country: venue.country,
      state: venue.state,
      city: venue.city,
      neighborhood: venue.neighborhood,
      denomination: venue.denomination,
      type: venue.type.name,
    );
  }

  static VenuesCompanion toCompanion(Venue venue) {
    return VenuesCompanion(
      id: venue.id == null ? const Value.absent() : Value(venue.id!),
      name: Value(venue.name),
      country: Value(venue.country),
      state: Value(venue.state),
      city: Value(venue.city),
      neighborhood: Value(venue.neighborhood),
      denomination: Value(venue.denomination),
      type: Value(venue.type.name),
    );
  }
}
