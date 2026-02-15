import 'package:TruthTracker/features/preached_at/data/preached_at.dart';
import 'package:TruthTracker/features/preacher/data/preacher.dart';

class Sermon {
  Preacher author;
  String theme;
  List<PreachedAt>? history;

  Sermon({required this.author, required this.theme});

  //getHistory(){}
}
