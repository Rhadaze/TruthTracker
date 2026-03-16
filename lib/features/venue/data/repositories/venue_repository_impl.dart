import 'package:TruthTracker/data/database/database.dart';
import 'package:TruthTracker/data/database/daos/venue_dao.dart';
import 'package:TruthTracker/features/venue/domain/entities/venue.dart';
import 'package:TruthTracker/features/venue/domain/repositories/venue_repository.dart';

class VenueRepositoryImpl implements VenueRepository {
  final VenueDao _venueDao;

  VenueRepositoryImpl(this._venueDao);

  @override
  Future<int> insertVenue(VenuesCompanion companion) {
    return _venueDao.insertVenue(companion);
  }

  @override
  Future<int> upsertVenue(VenuesCompanion companion) {
    return _venueDao.upsertVenue(companion);
  }

  @override
  Future<bool> updateVenue(Venue venue) {
    return _venueDao.updateVenue(venue);
  }

  @override
  Future<int> deleteById(int id) {
    return _venueDao.deleteById(id);
  }

  @override
  Future<Venue?> getById(int id) {
    return _venueDao.getById(id);
  }

  @override
  Stream<Venue?> watchById(int id) {
    return _venueDao.watchById(id);
  }

  @override
  Future<List<Venue>> getAll({bool desc = false}) {
    return _venueDao.getAll(desc: desc);
  }

  @override
  Stream<List<Venue>> watchAll({bool desc = false}) {
    return _venueDao.watchAll(desc: desc);
  }

  @override
  Future<List<Venue>> getAllByLocation() {
    return _venueDao.getAllByLocation();
  }

  @override
  Stream<List<Venue>> watchAllByLocation() {
    return _venueDao.watchAllByLocation();
  }
}
