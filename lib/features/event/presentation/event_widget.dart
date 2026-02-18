import 'package:TruthTracker/core/widgets/basic_app_card.dart';
import 'package:TruthTracker/features/event/domain/entities/event.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final Event e;

  const EventWidget(this.e);

  @override
  Widget build(BuildContext context) {
    return BasicAppCard(
      leadingIcon: Icons.access_time,
      title: e.sermon?.theme ?? "sem título",
      subtitle:
          "pregador: ${e.preacher?.name}\nData: ${e.date.toLocal().toString().split(' ')[0]}",
      trailingIcon: Icons.menu,
      onTap: () {
        print("hi");
      },
    );
    //throw UnimplementedError();
  }

  static List<EventWidget> fromList(List<Event> elist) {
    return elist.map((e) => EventWidget(e)).toList();
  }
}
