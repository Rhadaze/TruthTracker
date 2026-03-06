// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_dao.dart';

// ignore_for_file: type=lint
mixin _$EventDaoMixin on DatabaseAccessor<AppDatabase> {
  $SermonTableTable get sermonTable => attachedDatabase.sermonTable;
  $VenueTableTable get venueTable => attachedDatabase.venueTable;
  $PreacherTableTable get preacherTable => attachedDatabase.preacherTable;
  $EventTableTable get eventTable => attachedDatabase.eventTable;
  EventDaoManager get managers => EventDaoManager(this);
}

class EventDaoManager {
  final _$EventDaoMixin _db;
  EventDaoManager(this._db);
  $$SermonTableTableTableManager get sermonTable =>
      $$SermonTableTableTableManager(_db.attachedDatabase, _db.sermonTable);
  $$VenueTableTableTableManager get venueTable =>
      $$VenueTableTableTableManager(_db.attachedDatabase, _db.venueTable);
  $$PreacherTableTableTableManager get preacherTable =>
      $$PreacherTableTableTableManager(_db.attachedDatabase, _db.preacherTable);
  $$EventTableTableTableManager get eventTable =>
      $$EventTableTableTableManager(_db.attachedDatabase, _db.eventTable);
}
