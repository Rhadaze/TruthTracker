import 'package:TruthTracker/data/database/database.dart';

class SermonWithAuthorRow {
  final SermonData sermonData;
  final PreacherData? authorData;

  SermonWithAuthorRow(this.sermonData, this.authorData);
}
