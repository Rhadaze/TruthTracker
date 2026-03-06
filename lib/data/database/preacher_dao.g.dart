// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preacher_dao.dart';

// ignore_for_file: type=lint
mixin _$PreacherDaoMixin on DatabaseAccessor<AppDatabase> {
  $PreacherTableTable get preacherTable => attachedDatabase.preacherTable;
  PreacherDaoManager get managers => PreacherDaoManager(this);
}

class PreacherDaoManager {
  final _$PreacherDaoMixin _db;
  PreacherDaoManager(this._db);
  $$PreacherTableTableTableManager get preacherTable =>
      $$PreacherTableTableTableManager(_db.attachedDatabase, _db.preacherTable);
}
