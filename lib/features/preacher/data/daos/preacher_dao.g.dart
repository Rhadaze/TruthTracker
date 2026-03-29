// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preacher_dao.dart';

// ignore_for_file: type=lint
mixin _$PreacherDaoMixin on DatabaseAccessor<AppDatabase> {
  $VenuesTable get venues => attachedDatabase.venues;
  $PreachersTable get preachers => attachedDatabase.preachers;
  PreacherDaoManager get managers => PreacherDaoManager(this);
}

class PreacherDaoManager {
  final _$PreacherDaoMixin _db;
  PreacherDaoManager(this._db);
  $$VenuesTableTableManager get venues =>
      $$VenuesTableTableManager(_db.attachedDatabase, _db.venues);
  $$PreachersTableTableManager get preachers =>
      $$PreachersTableTableManager(_db.attachedDatabase, _db.preachers);
}
