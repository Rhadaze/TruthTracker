import 'package:TruthTracker/features/event/domain/entities/event.dart';
import 'package:TruthTracker/features/preacher/data/preacher.dart';

class Sermon {
  Preacher? author;
  String theme;
  List<Event>? history;

  Sermon({this.author, required this.theme});

  //getHistory(){}
}
