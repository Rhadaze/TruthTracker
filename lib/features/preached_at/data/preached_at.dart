import 'package:TruthTracker/features/preacher/data/preacher.dart';
import 'package:TruthTracker/features/sermon/data/sermon.dart';
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
