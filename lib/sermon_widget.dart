import 'package:TruthTracker/Sermon.dart';
import 'package:TruthTracker/basic_app_card.dart';
import 'package:flutter/material.dart';

class SermonWidget extends StatelessWidget {
  final Sermon sermon;

  const SermonWidget(this.sermon);

  @override
  Widget build(BuildContext context) {
    return BasicAppCard(
      leadingIcon: Icons.book,
      title: sermon.theme,
      subtitle: sermon.author.name ?? "No name",
      trailingIcon: Icons.menu,
      onTap: () {
        print("hi");
      },
    );
    //throw UnimplementedError();
  }

  static List<SermonWidget> fromList(List<Sermon> slist) {
    return slist.map((s) => SermonWidget(s)).toList();
  }
}
