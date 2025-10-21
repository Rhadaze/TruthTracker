import 'package:TruthTracker/PreachedAt.dart';
import 'package:TruthTracker/Preacher.dart';

class Sermon {
  Preacher author;
  String theme;
  List<PreachedAt>? history;

  Sermon({required this.author, required this.theme});

  void show() {
    print(author);
  }

  //getHistory(){}
}
