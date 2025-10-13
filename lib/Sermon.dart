import 'package:app_de_teste/PreachedAt.dart';

class Sermon {

  String author;
  String theme;
  List<PreachedAt>? history;

  Sermon({
    required this.author,
    required this.theme
  });

  void show() {
    print(author);
  }
  
  //getHistory(){} 

}