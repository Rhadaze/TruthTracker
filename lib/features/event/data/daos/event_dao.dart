import 'package:TruthTracker/data/database/database.dart';
import 'package:TruthTracker/data/tables/events.dart';
import 'package:TruthTracker/data/tables/preachers.dart';
import 'package:TruthTracker/data/tables/sermons.dart';
import 'package:TruthTracker/data/tables/venues.dart';
import 'package:TruthTracker/features/event/data/rows/event_complete_row.dart';
import 'package:drift/drift.dart';

part 'event_dao.g.dart';

@DriftAccessor(tables: [Events, Preachers, Venues, Sermons])
class EventDao extends DatabaseAccessor<AppDatabase> with _$EventDaoMixin {
  EventDao(super.db);

  //========================
  //  Inserts and Updates
  //========================
  Future<int> insert(EventsCompanion companion) {
    return into(events).insert(companion);
  }

  Future<int> upsert(EventsCompanion companion) {
    return into(events).insertOnConflictUpdate(companion);
  }

  Future<bool> replace(EventData eventData) {
    return update(events).replace(eventData);
  }

  Future<int> updateFields(int id, EventsCompanion changes) {
    return (update(events)..where((t) => t.id.equals(id))).write(changes);
  }

  //========================
  //       Deletes
  //========================
  Future<int> deleteById(int id) {
    return (delete(events)..where((t) => t.id.equals(id))).go();
  }

  //========================
  //  Getters and watchers
  //========================
  Future<EventCompleteRow?> getById(int id) async {
    final joins = [
      leftOuterJoin(preachers, preachers.id.equalsExp(events.preacherId)),
      leftOuterJoin(venues, venues.id.equalsExp(events.venueId)),
      leftOuterJoin(sermons, sermons.id.equalsExp(events.sermonId)),
    ];

    final query = select(events).join(joins)..where(events.id.equals(id));

    final row = await query.getSingleOrNull();

    return row == null ? null : _mapJoinedRow(row);
  }

  Stream<EventCompleteRow?> watchById(int id) {
    final joins = [
      leftOuterJoin(preachers, preachers.id.equalsExp(events.preacherId)),
      leftOuterJoin(venues, venues.id.equalsExp(events.venueId)),
      leftOuterJoin(sermons, sermons.id.equalsExp(events.sermonId)),
    ];

    final query = select(events).join(joins)..where(events.id.equals(id));

    final rowStream = query.watchSingleOrNull();

    return rowStream.map((row) {
      if (row == null) return null;
      return _mapJoinedRow(row);
    });
  }

  Future<List<EventCompleteRow>> getListItems({
    DateTime? date,
    int? venueId,
    int? preacherId,
    int? sermonId,
    bool desc = true,
  }) async {
    final filter = _buildEventFilter(
      date: date,
      preacherId: preacherId,
      venueId: venueId,
      sermonId: sermonId,
    );

    final query = select(events).join(_joinBuilder());

    if (filter != null) {
      query.where(filter);
    }
    query.orderBy([_dateOrdering(desc)]);

    final rows = await query.get();

    return rows.map((row) {
      return _mapJoinedRow(row);
    }).toList();
  }

  Stream<List<EventCompleteRow>> watchListItems({
    DateTime? date,
    int? venueId,
    int? preacherId,
    int? sermonId,
    bool desc = true,
  }) {
    final filter = _buildEventFilter(
      date: date,
      preacherId: preacherId,
      venueId: venueId,
      sermonId: sermonId,
    );

    final query = select(events).join(_joinBuilder());

    if (filter != null) {
      query.where(filter);
    }
    query.orderBy([_dateOrdering(desc)]);

    final rows = query.watch();

    return rows.map((list) => list.map(_mapJoinedRow).toList());
  }

  //========================
  //        Helpers
  //========================
  OrderingTerm _dateOrdering([bool desc = false]) {
    return desc
        ? OrderingTerm.desc(events.date)
        : OrderingTerm.asc(events.date);
  }

  Expression<bool> _isOnDay(DateTime day) {
    final startOfDay = DateTime(day.year, day.month, day.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return events.date.isBiggerOrEqualValue(startOfDay) &
        events.date.isSmallerThanValue(endOfDay);
  }

  EventCompleteRow _mapJoinedRow(TypedResult row) {
    return EventCompleteRow(
      eventData: row.readTable(events),
      preacherData: row.readTable(preachers),
      venueData: row.readTable(venues),
      sermonData: row.readTableOrNull(sermons),
    );
  }

  Expression<bool>? _buildEventFilter({
    DateTime? date,
    int? preacherId,
    int? venueId,
    int? sermonId,
  }) {
    final filters = <Expression<bool>>[];

    if (date != null) {
      filters.add(_isOnDay(date));
    }
    if (preacherId != null) {
      filters.add(events.preacherId.equals(preacherId));
    }

    if (venueId != null) {
      filters.add(events.venueId.equals(venueId));
    }

    if (sermonId != null) {
      filters.add(events.sermonId.equals(sermonId));
    }

    if (filters.isEmpty) return null;

    return filters.reduce((acc, item) => acc & item);
  }

  // if (_hasText(country)) {
  //   filters.add(venues.country.equals(country.trim()));
  // }

  List<Join<HasResultSet, dynamic>> _joinBuilder() {
    final joins = [
      leftOuterJoin(preachers, preachers.id.equalsExp(events.preacherId)),
      leftOuterJoin(venues, venues.id.equalsExp(events.venueId)),
      leftOuterJoin(sermons, sermons.id.equalsExp(events.sermonId)),
    ];
    return joins;
  }
}
