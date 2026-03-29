import 'dart:convert';
import 'package:TruthTracker/data/database/database.dart';
import 'package:TruthTracker/features/preacher/domain/entities/preacher.dart';
import 'package:drift/drift.dart';

class PreacherMapper {
  static Preacher toDomain(PreacherData data) {
    final languages = _languageDecoderToList(data.languages);
    return Preacher(
      id: data.id,
      name: data.name,
      email: data.email,
      phone: data.phone,
      languages: languages,
      denomination: data.denomination,
      notes: data.notes,
      homeVenueId: data.homeVenueId,
    );
  }

  static PreachersCompanion toCompanion(Preacher preacher) {
    final languages = jsonEncode(preacher.languages);
    return PreachersCompanion(
      id: preacher.id == null ? const Value.absent() : Value(preacher.id!),
      name: Value(preacher.name),
      email: Value(preacher.email),
      phone: Value(preacher.phone),
      languages: Value(languages),
      denomination: Value(preacher.denomination),
      notes: Value(preacher.notes),
      homeVenueId: Value(preacher.homeVenueId),
    );
  }

  static PreacherData toData(Preacher preacher) {
    if (preacher.id == null) {
      throw ArgumentError(
        'Cannot convert Preacher to PreacherData without id.',
      );
    }
    final languages = jsonEncode(preacher.languages);

    return PreacherData(
      id: preacher.id!,
      name: preacher.name,
      email: preacher.email,
      phone: preacher.phone,
      languages: languages,
      denomination: preacher.denomination,
      notes: preacher.notes,
      homeVenueId: preacher.homeVenueId,
    );
  }

  static List<String> _languageDecoderToList(String? languages) {
    if (languages == null || languages.trim().isEmpty) {
      return [];
    } else {
      return (jsonDecode(languages) as List).cast<String>();
    }
  }
}
