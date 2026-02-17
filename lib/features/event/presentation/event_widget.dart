import 'package:TruthTracker/core/widgets/basic_app_card.dart';
import 'package:TruthTracker/features/event/domain/entities/event.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final Event pa;

  const EventWidget(this.pa);

  @override
  Widget build(BuildContext context) {
    return BasicAppCard(
      leadingIcon: Icons.access_time,
      title: pa.sermon.theme,
      subtitle:
          "pregador: ${pa.preacher.name}\nData: ${pa.date?.toLocal().toString().split(' ')[0]}",
      trailingIcon: Icons.menu,
      onTap: () {
        print("hi");
      },
    );
    //throw UnimplementedError();
  }

  static List<EventWidget> fromList(List<Event> palist) {
    return palist.map((pa) => EventWidget(pa)).toList();
  }
}
