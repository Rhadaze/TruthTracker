import 'package:TruthTracker/features/sermon/domain/entities/sermon.dart';
import 'package:TruthTracker/core/widgets/basic_app_card.dart';
import 'package:flutter/material.dart';

class SermonWidget extends StatelessWidget {
  final Sermon sermon;

  const SermonWidget(this.sermon);

  @override
  Widget build(BuildContext context) {
    return BasicAppCard(
      leadingIcon: Icons.book,
      title: sermon.title,
      //subtitle: sermon.author?.name ?? "Sem nome", //TODO set persistência and fix this line
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
