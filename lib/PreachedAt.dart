import 'package:app_de_teste/sermon.dart';

class PreachedAt {

  String place;
  DateTime? date;
  Sermon sermon;
  String preacher;
  
  PreachedAt({required this.place, this.date, required this.sermon, required this.preacher});

}