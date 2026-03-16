import 'package:TruthTracker/data/database/database.dart';
import 'package:TruthTracker/features/venue/domain/entities/venue.dart';

abstract class VenueRepository {
  Future<int> insertVenue(VenuesCompanion companion);
  Future<int> upsertVenue(VenuesCompanion companion);
  Future<bool> updateVenue(Venue venue);
  Future<int> deleteById(int id);
  Future<Venue?> getById(int id);
  Stream<Venue?> watchById(int id);
  Future<List<Venue>> getAll({bool desc = false});
  Stream<List<Venue>> watchAll({bool desc = false});
  Future<List<Venue>> getAllByLocation();
  Stream<List<Venue>> watchAllByLocation();
}
