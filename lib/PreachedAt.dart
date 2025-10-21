import 'package:TruthTracker/Preacher.dart';
import 'package:TruthTracker/Sermon.dart';

class PreachedAt {
  String place;
  DateTime? date;
  Sermon sermon;
  Preacher preacher;

  PreachedAt({
    required this.place,
    this.date,
    required this.sermon,
    required this.preacher,
  });
}
