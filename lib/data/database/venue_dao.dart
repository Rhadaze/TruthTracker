import 'package:TruthTracker/data/database/database.dart';
import 'package:TruthTracker/data/tables/venues.dart';
import 'package:drift/drift.dart';

part 'venue_dao.g.dart';

@DriftAccessor(tables: [Venues])
class VenueDao extends DatabaseAccessor<AppDatabase> with _$VenueDaoMixin {
  VenueDao(super.db);
}
