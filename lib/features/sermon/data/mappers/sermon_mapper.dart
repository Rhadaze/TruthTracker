import 'package:TruthTracker/data/database/database.dart';
import 'package:TruthTracker/features/preacher/data/mappers/preacher_mapper.dart';
import 'package:TruthTracker/features/preacher/domain/entities/preacher.dart';
import 'package:TruthTracker/features/sermon/data/rows/sermon_with_author_row.dart';
import 'package:TruthTracker/features/sermon/domain/entities/sermon.dart';
import 'package:drift/drift.dart';

class SermonMapper {
  static Sermon toDomain(SermonData sermonData, {Preacher? author}) {
    return Sermon(
      id: sermonData.id,
      title: sermonData.title,
      theme: sermonData.theme,
      mainText: sermonData.mainText,
      notes: sermonData.notes,
      createdAt: sermonData.createdAt,
      updatedAt: sermonData.updatedAt,
      isPublished: sermonData.isPublished,
      author: author,
    );
  }

  static Sermon fromJoinedRow(SermonWithAuthorRow row) {
    final author = row.authorData == null
        ? null
        : PreacherMapper.toDomain(row.authorData!);

    return toDomain(row.sermonData, author: author);
  }

  static SermonsCompanion toCompanion(Sermon sermon) {
    final authorId = sermon.author?.id;

    if (sermon.author != null && authorId == null) {
      throw ArgumentError('Cannot convert: Author exists but has no id.');
    }

    return SermonsCompanion(
      id: sermon.id == null ? const Value.absent() : Value(sermon.id!),
      title: Value(sermon.title),
      theme: Value(sermon.theme),
      mainText: Value(sermon.mainText),
      notes: Value(sermon.notes),
      createdAt: Value(sermon.createdAt),
      updatedAt: Value(sermon.updatedAt),
      isPublished: Value(sermon.isPublished),
      authorId: Value(authorId),
    );
  }

  static SermonData toData(Sermon sermon) {
    if (sermon.id == null) {
      throw ArgumentError('Cannot convert Sermon to SermonData without id.');
    }
    return SermonData(
      id: sermon.id!,
      title: sermon.title,
      theme: sermon.theme,
      mainText: sermon.mainText,
      notes: sermon.notes,
      createdAt: sermon.createdAt,
      updatedAt: sermon.updatedAt,
      isPublished: sermon.isPublished,
      authorId: sermon.author?.id,
    );
  }
}
