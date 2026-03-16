import 'package:TruthTracker/data/database/database.dart';
import 'package:TruthTracker/features/preacher/domain/entities/preacher.dart';
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

  static SermonsCompanion toCompanion(Sermon sermon) {
    return SermonsCompanion(
      id: sermon.id == null ? const Value.absent() : Value(sermon.id!),
      title: Value(sermon.title),
      theme: Value(sermon.theme),
      mainText: Value(sermon.mainText),
      notes: Value(sermon.notes),
      createdAt: Value(sermon.createdAt),
      updatedAt: Value(sermon.updatedAt),
      isPublished: Value(sermon.isPublished),
      authorId: sermon.author == null
          ? const Value.absent()
          : Value(sermon.author!.id),
    );
  }

  static SermonData toData(Sermon sermon) {
    return SermonData(
      id: sermon.id ?? 0,
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
