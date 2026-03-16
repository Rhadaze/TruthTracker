// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sermon_dao.dart';

// ignore_for_file: type=lint
mixin _$SermonDaoMixin on DatabaseAccessor<AppDatabase> {
  $PreachersTable get preachers => attachedDatabase.preachers;
  $SermonsTable get sermons => attachedDatabase.sermons;
  SermonDaoManager get managers => SermonDaoManager(this);
}

class SermonDaoManager {
  final _$SermonDaoMixin _db;
  SermonDaoManager(this._db);
  $$PreachersTableTableManager get preachers =>
      $$PreachersTableTableManager(_db.attachedDatabase, _db.preachers);
  $$SermonsTableTableManager get sermons =>
      $$SermonsTableTableManager(_db.attachedDatabase, _db.sermons);
}
