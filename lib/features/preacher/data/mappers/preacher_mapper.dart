import 'package:TruthTracker/data/database/database.dart';
import 'package:TruthTracker/features/preacher/domain/entities/preacher.dart';
import 'package:drift/drift.dart';

class PreacherMapper {
  static Preacher toDomain(PreacherData data) {
    return Preacher(
      id: data.id,
      name: data.name,
      email: data.email,
      phone: data.phone,
      languages: data.languages,
      denomination: data.denomination,
    );
  }

  static PreachersCompanion toCompanion(Preacher preacher) {
    return PreachersCompanion(
      id: preacher.id == null ? const Value.absent() : Value(preacher.id!),
      name: Value(preacher.name),
      email: Value(preacher.email),
      phone: Value(preacher.phone),
      languages: Value(preacher.languages),
      denomination: Value(preacher.denomination),
    );
  }
}
