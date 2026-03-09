import 'package:TruthTracker/data/database/database.dart';
import 'package:TruthTracker/data/tables/venues.dart';
import 'package:TruthTracker/features/venue/domain/enums/localidade.dart';
import 'package:drift/drift.dart';

part 'venue_dao.g.dart';

@DriftAccessor(tables: [Venues])
class VenueDao extends DatabaseAccessor<AppDatabase> with _$VenueDaoMixin {
  VenueDao(super.db);

  Future<int> insertVenue(VenuesCompanion companion) {
    return into(venues).insert(companion);
  }

  Future<int> upsertVenue(VenuesCompanion companion) {
    return into(venues).insertOnConflictUpdate(companion);
  }

  Future<bool> updateVenue(Venue venue) {
    return update(venues).replace(venue);
  }

  Future<int> deleteById(int id) {
    return (delete(venues)..where((t) => t.id.equals(id))).go();
  }

  Future<Venue?> getById(int id) {
    return (select(venues)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Stream<Venue?> watchById(int id) {
    return (select(venues)..where((t) => t.id.equals(id))).watchSingleOrNull();
  }

  Future<List<Venue>> getAll({bool desc = false}) {
    final ordering = desc
        ? OrderingTerm.desc(venues.name)
        : OrderingTerm.asc(venues.name);

    return (select(venues)..orderBy([(_) => ordering])).get();
  }

  Stream<List<Venue>> watchAll({bool desc = false}) {
    final ordering = desc
        ? OrderingTerm.desc(venues.name)
        : OrderingTerm.asc(venues.name);

    return (select(venues)..orderBy([(_) => ordering])).watch();
  }

  Future<List<Venue>> getAllByLocation({
    String? country,
    String? state,
    String? city,
    String? neighborhood,
    LocationLevel orderBy = LocationLevel.city,
  }) {
    Expression<bool>? filter;

    if (country != null && country.isNotEmpty) {
      filter = venues.country.equals(country);
    }

    if (state != null && state.isNotEmpty) {
      final stateFilter = venues.state.equals(state);
      filter = filter == null ? stateFilter : filter & stateFilter;
    }

    if (city != null && city.isNotEmpty) {
      final cityFilter = venues.city.equals(city);
      filter = filter == null ? cityFilter : filter & cityFilter;
    }

    if (neighborhood != null && neighborhood.isNotEmpty) {
      final neighborhoodFilter = venues.neighborhood.equals(neighborhood);
      filter = filter == null
          ? neighborhoodFilter
          : filter & neighborhoodFilter;
    }

    final query = select(venues);

    if (filter != null) {
      query.where((_) => filter!);
    }

    query.orderBy(_buildOrdering(orderBy));

    return query.get();
  }

  Stream<List<Venue>> watchAllByLocation({
    String? country,
    String? state,
    String? city,
    String? neighborhood,
    LocationLevel orderBy = LocationLevel.city,
  }) {
    Expression<bool>? filter;

    if (country != null && country.isNotEmpty) {
      filter = venues.country.equals(country);
    }

    if (state != null && state.isNotEmpty) {
      final stateFilter = venues.state.equals(state);
      filter = filter == null ? stateFilter : filter & stateFilter;
    }

    if (city != null && city.isNotEmpty) {
      final cityFilter = venues.city.equals(city);
      filter = filter == null ? cityFilter : filter & cityFilter;
    }

    if (neighborhood != null && neighborhood.isNotEmpty) {
      final neighborhoodFilter = venues.neighborhood.equals(neighborhood);
      filter = filter == null
          ? neighborhoodFilter
          : filter & neighborhoodFilter;
    }

    final query = select(venues);

    if (filter != null) {
      query.where((_) => filter!);
    }

    query.orderBy(_buildOrdering(orderBy));

    return query.watch();
  }

  List<OrderClauseGenerator<$VenuesTable>> _buildOrdering(
    LocationLevel orderBy,
  ) {
    switch (orderBy) {
      case LocationLevel.country:
        return [
          (t) => OrderingTerm.asc(t.country),
          (t) => OrderingTerm.asc(t.state),
          (t) => OrderingTerm.asc(t.city),
          (t) => OrderingTerm.asc(t.neighborhood),
          (t) => OrderingTerm.asc(t.name),
        ];
      case LocationLevel.state:
        return [
          (t) => OrderingTerm.asc(t.state),
          (t) => OrderingTerm.asc(t.country),
          (t) => OrderingTerm.asc(t.city),
          (t) => OrderingTerm.asc(t.neighborhood),
          (t) => OrderingTerm.asc(t.name),
        ];
      case LocationLevel.city:
        return [
          (t) => OrderingTerm.asc(t.city),
          (t) => OrderingTerm.asc(t.country),
          (t) => OrderingTerm.asc(t.state),
          (t) => OrderingTerm.asc(t.neighborhood),
          (t) => OrderingTerm.asc(t.name),
        ];
      case LocationLevel.neighborhood:
        return [
          (t) => OrderingTerm.asc(t.neighborhood),
          (t) => OrderingTerm.asc(t.country),
          (t) => OrderingTerm.asc(t.state),
          (t) => OrderingTerm.asc(t.city),
          (t) => OrderingTerm.asc(t.name),
        ];
    }
  }
}

  // final int id;
  // final String name;
  // final String? neighborhood;
  // final String city;
  // final String state;
  // final String denominacao;