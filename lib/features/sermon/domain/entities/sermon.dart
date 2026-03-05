import 'package:TruthTracker/features/preacher/domain/entities/preacher.dart';

class Sermon {
  final int id;
  final Preacher? author;

  final String title;
  final String? theme;
  final String? mainText;
  final String? notes;

  final DateTime?
  createdAt; //TODO colocar nonnullable e required depois de implementar a persistência
  final DateTime? updatedAt;

  final bool isPublished;

  final List<String>
  tags; // TODO pesquisar se é melhor manter como string ou haver uma classe tags

  const Sermon({
    required this.id,
    this.author,
    required this.title,
    this.theme,
    this.mainText,
    this.notes,
    this.createdAt,
    this.updatedAt,
    this.isPublished = false,
    this.tags = const [],
  });
}
