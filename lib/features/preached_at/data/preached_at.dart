import 'package:TruthTracker/Preacher.dart';
import 'package:TruthTracker/Sermon.dart';
import 'package:TruthTracker/features/church/data/church.dart';

class PreachedAt {
  String place;
  DateTime? date;
  Sermon sermon;
  Preacher preacher;
  Church church;

  PreachedAt({
    required this.place,
    this.date,
    required this.sermon,
    required this.preacher,
    required this.church,
  });
}
