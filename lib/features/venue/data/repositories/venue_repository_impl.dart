import 'package:TruthTracker/features/venue/data/daos/venue_dao.dart';
import 'package:TruthTracker/features/venue/data/mappers/venue_mapper.dart';
import 'package:TruthTracker/features/venue/domain/entities/venue.dart';
import 'package:TruthTracker/features/venue/domain/enums/location_level.dart';
import 'package:TruthTracker/features/venue/domain/repositories/venue_repository.dart';

class VenueRepositoryImpl implements VenueRepository {
  final VenueDao _venueDao;

  VenueRepositoryImpl(this._venueDao);

  //========================
  //  Inserts and Updates
  //========================
  @override
  Future<int> insert(Venue venue) {
    final companion = VenueMapper.toCompanion(venue);
    return _venueDao.insert(companion);
  }

  @override
  Future<int> upsert(Venue venue) {
    final companion = VenueMapper.toCompanion(venue);
    return _venueDao.upsert(companion);
  }

  @override
  Future<bool> replace(Venue venue) {
    final data = VenueMapper.toData(venue);
    return _venueDao.replace(data);
  }

  //========================
  //       Deletes
  //========================
  @override
  Future<int> deleteById(int id) {
    return _venueDao.deleteById(id);
  }

  //========================
  //  Getters and watchers
  //========================
  @override
  Future<Venue?> getById(int id) async {
    final venueData = await _venueDao.getById(id);
    if (venueData == null) return null;
    return VenueMapper.toDomain(venueData);
  }

  @override
  Stream<Venue?> watchById(int id) {
    final venueDataStream = _venueDao.watchById(id);
    return venueDataStream.map(
      (data) => data == null ? null : VenueMapper.toDomain(data),
    );
  }

  @override
  Future<List<Venue>> getAll({bool desc = false}) async {
    final venuesData = await _venueDao.getAll(desc: desc);
    return venuesData.map(VenueMapper.toDomain).toList();
  }

  @override
  Stream<List<Venue>> watchAll({bool desc = false}) {
    final venuesDataStream = _venueDao.watchAll(desc: desc);
    return venuesDataStream.map((lista) {
      return lista.map(VenueMapper.toDomain).toList();
    });
  }

  @override
  Future<List<Venue>> getAllByLocation({
    String? country,
    String? state,
    String? city,
    String? neighborhood,
    LocationLevel orderBy = LocationLevel.city,
  }) async {
    final venuesData = await _venueDao.getAllByLocation(
      country: country,
      state: state,
      city: city,
      neighborhood: neighborhood,
      orderBy: orderBy,
    );
    return venuesData.map(VenueMapper.toDomain).toList();
  }

  @override
  Stream<List<Venue>> watchAllByLocation({
    String? country,
    String? state,
    String? city,
    String? neighborhood,
    LocationLevel orderBy = LocationLevel.city,
  }) {
    final venuesDataStream = _venueDao.watchAllByLocation(
      country: country,
      state: state,
      city: city,
      neighborhood: neighborhood,
      orderBy: orderBy,
    );
    return venuesDataStream.map((lista) {
      return lista.map(VenueMapper.toDomain).toList();
    });
  }
}
