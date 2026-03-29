// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_dao.dart';

// ignore_for_file: type=lint
mixin _$EventDaoMixin on DatabaseAccessor<AppDatabase> {
  $VenuesTable get venues => attachedDatabase.venues;
  $PreachersTable get preachers => attachedDatabase.preachers;
  $SermonsTable get sermons => attachedDatabase.sermons;
  $EventsTable get events => attachedDatabase.events;
  EventDaoManager get managers => EventDaoManager(this);
}

class EventDaoManager {
  final _$EventDaoMixin _db;
  EventDaoManager(this._db);
  $$VenuesTableTableManager get venues =>
      $$VenuesTableTableManager(_db.attachedDatabase, _db.venues);
  $$PreachersTableTableManager get preachers =>
      $$PreachersTableTableManager(_db.attachedDatabase, _db.preachers);
  $$SermonsTableTableManager get sermons =>
      $$SermonsTableTableManager(_db.attachedDatabase, _db.sermons);
  $$EventsTableTableManager get events =>
      $$EventsTableTableManager(_db.attachedDatabase, _db.events);
}
