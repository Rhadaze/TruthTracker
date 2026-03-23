import 'package:TruthTracker/features/venue/domain/entities/venue.dart';
import 'package:TruthTracker/features/venue/domain/enums/location_level.dart';

abstract class VenueRepository {
  Future<int> insert(Venue venue);
  Future<int> upsert(Venue venue);
  Future<bool> replace(Venue venue);
  Future<int> deleteById(int id);
  Future<Venue?> getById(int id);
  Stream<Venue?> watchById(int id);
  Future<List<Venue>> getAll({bool desc = false});
  Stream<List<Venue>> watchAll({bool desc = false});
  Future<List<Venue>> getAllByLocation({
    String? country,
    String? state,
    String? city,
    String? neighborhood,
    LocationLevel orderBy = LocationLevel.city,
  });
  Stream<List<Venue>> watchAllByLocation({
    String? country,
    String? state,
    String? city,
    String? neighborhood,
    LocationLevel orderBy = LocationLevel.city,
  });
}
