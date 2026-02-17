import 'package:TruthTracker/features/preached_at/domain/entities/preached_at.dart';
import 'package:TruthTracker/features/preacher/data/preacher.dart';

class Sermon {
  Preacher author;
  String theme;
  List<Event>? history;

  Sermon({required this.author, required this.theme});

  //getHistory(){}
}
