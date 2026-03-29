import 'package:TruthTracker/data/database/database.dart';
import 'package:TruthTracker/data/tables/venues.dart';
import 'package:TruthTracker/features/venue/domain/enums/location_level.dart';
import 'package:TruthTracker/features/venue/models/venue_list_item.dart';
import 'package:drift/drift.dart';

part 'venue_dao.g.dart';

@DriftAccessor(tables: [Venues])
class VenueDao extends DatabaseAccessor<AppDatabase> with _$VenueDaoMixin {
  VenueDao(super.db);

  //========================
  //  Inserts and Updates
  //========================
  Future<int> insert(VenuesCompanion companion) {
    return into(venues).insert(companion);
  }

  Future<int> upsert(VenuesCompanion companion) {
    return into(venues).insertOnConflictUpdate(companion);
  }

  Future<bool> replace(VenueData data) {
    return update(venues).replace(data);
  }

  //========================
  //       Deletes
  //========================
  Future<int> deleteById(int id) {
    return (delete(venues)..where((t) => t.id.equals(id))).go();
  }

  //========================
  //  Getters and watchers
  //========================
  Future<VenueData?> getById(int id) {
    return (select(venues)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Stream<VenueData?> watchById(int id) {
    return (select(venues)..where((t) => t.id.equals(id))).watchSingleOrNull();
  }

  Future<List<VenueData>> getAll({bool desc = false}) {
    return (select(venues)..orderBy([(_) => _nameOrdering(desc)])).get();
  }

  Stream<List<VenueData>> watchAll({bool desc = false}) {
    return (select(venues)..orderBy([(_) => _nameOrdering(desc)])).watch();
  }

  Future<List<VenueData>> getAllByLocation({
    String? country,
    String? state,
    String? city,
    String? neighborhood,
    LocationLevel orderBy = LocationLevel.city,
  }) {
    final query = select(venues);
    final filter = _buildLocationFilter(
      country: country,
      state: state,
      city: city,
      neighborhood: neighborhood,
    );

    if (filter != null) {
      query.where((_) => filter);
    }
    query.orderBy(_buildOrdering(orderBy));

    return query.get();
  }

  Stream<List<VenueData>> watchAllByLocation({
    String? country,
    String? state,
    String? city,
    String? neighborhood,
    LocationLevel orderBy = LocationLevel.city,
  }) {
    final query = select(venues);
    final filter = _buildLocationFilter(
      country: country,
      state: state,
      city: city,
      neighborhood: neighborhood,
    );

    if (filter != null) {
      query.where((_) => filter);
    }

    query.orderBy(_buildOrdering(orderBy));
    return query.watch();
  }

  Future<List<VenueListItem>> getListItems([bool desc = false]) async {
    final query = selectOnly(venues)
      ..addColumns([venues.id, venues.name])
      ..orderBy([_nameOrdering(desc)]);

    final rows = await query.get();

    return rows.map((row) {
      return VenueListItem(
        row.read(venues.id)!, // eu não preciso de um nullcheck aqui não?
        row.read(venues.name)!,
      );
    }).toList();
  }

  Future<List<VenueListItem>> searchListItems({
    required String search,
    bool desc = false,
  }) async {
    final s = search.trim();
    if (s.isEmpty) {
      return [];
    }

    final query = selectOnly(venues)
      ..addColumns([venues.id, venues.name])
      ..where(venues.name.like('%$s%'))
      ..orderBy([_nameOrdering(desc)]);

    final rows = await query.get();

    return rows.map((row) {
      return VenueListItem(
        row.read(venues.id)!, // eu não preciso de um nullcheck aqui não?
        row.read(venues.name)!,
      );
    }).toList();
  }

  //========================
  //        Helpers
  //========================
  OrderingTerm _nameOrdering([bool desc = false]) {
    return desc
        ? OrderingTerm.desc(venues.name)
        : OrderingTerm.asc(venues.name);
  }

  List<OrderClauseGenerator<$VenuesTable>> _buildOrdering(
    LocationLevel orderBy,
  ) {
    //  TODO tenho que tratar o fato de neighborhood ser nullable
    //  e causar comportamento estranho, ordenando venus sem bairro
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

  Expression<bool>? _buildLocationFilter({
    String? country,
    String? state,
    String? city,
    String? neighborhood,
  }) {
    final filters = <Expression<bool>>[];

    if (country != null && country.trim().isNotEmpty) {
      filters.add(venues.country.equals(country.trim()));
    }

    if (state != null && state.trim().isNotEmpty) {
      filters.add(venues.state.equals(state.trim()));
    }

    if (city != null && city.trim().isNotEmpty) {
      filters.add(venues.city.equals(city.trim()));
    }

    if (neighborhood != null && neighborhood.trim().isNotEmpty) {
      filters.add(venues.neighborhood.equals(neighborhood.trim()));
    }

    if (filters.isEmpty) return null;

    return filters.reduce((acc, item) => acc & item);
  }

  // if (_hasText(country)) {
  //   filters.add(venues.country.equals(country.trim()));
  // }
}
