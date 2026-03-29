import 'package:TruthTracker/features/preacher/domain/entities/preacher.dart';

class Sermon {
  final int? id;
  final Preacher? author;

  final String title;
  final String? theme;
  final String? mainText;
  final String? notes;

  final DateTime createdAt;
  final DateTime? updatedAt;

  final bool isPublished;

  final List<String> tags; //Ainda não implementado.

  const Sermon({
    this.id,
    this.author,
    required this.title,
    this.theme,
    this.mainText,
    this.notes,
    required this.createdAt,
    this.updatedAt,
    this.isPublished = false,
    this.tags = const [],
  });
}
