// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue_dao.dart';

// ignore_for_file: type=lint
mixin _$VenueDaoMixin on DatabaseAccessor<AppDatabase> {
  $VenuesTable get venues => attachedDatabase.venues;
  VenueDaoManager get managers => VenueDaoManager(this);
}

class VenueDaoManager {
  final _$VenueDaoMixin _db;
  VenueDaoManager(this._db);
  $$VenuesTableTableManager get venues =>
      $$VenuesTableTableManager(_db.attachedDatabase, _db.venues);
}
