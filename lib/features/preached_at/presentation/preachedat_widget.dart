import 'package:TruthTracker/core/widgets/basic_app_card.dart';
import 'package:TruthTracker/features/event/domain/entities/event.dart';
import 'package:flutter/material.dart';

class PreachedAtWidget extends StatelessWidget {
  final Event pa;

  const PreachedAtWidget(this.pa);

  @override
  Widget build(BuildContext context) {
    return BasicAppCard(
      leadingIcon: Icons.access_time,
      title: pa.sermon?.theme ?? "sem sermão",
      subtitle:
          "pregador: ${pa.preacher.name}\nData: ${pa.date.toLocal().toString().split(' ')[0]}",
      trailingIcon: Icons.menu,
      onTap: () {
        print("hi");
      },
    );
    //throw UnimplementedError();
  }

  static List<PreachedAtWidget> fromList(List<Event> palist) {
    return palist.map((pa) => PreachedAtWidget(pa)).toList();
  }
}
