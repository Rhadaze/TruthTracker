import 'package:TruthTracker/core/layout/app_drawer.dart';
import 'package:TruthTracker/features/venue/domain/entities/venue.dart';
import 'package:TruthTracker/features/event/domain/entities/event.dart';
import 'package:TruthTracker/features/event/presentation/event_widget.dart';
import 'package:TruthTracker/features/preacher/domain/entities/preacher.dart';
import 'package:TruthTracker/features/sermon/domain/entities/sermon.dart';
import 'package:TruthTracker/core/data/dummy_data.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  final List<Preacher> p;
  final List<Sermon> s;
  final List<Venue> v;
  final List<Event> e;

  EventsPage({super.key})
    : v = [],
      p = DummyData.populatePreachers(),
      s = [],
      e = [] {
    v.addAll(DummyData.populateVenues());
    s.addAll(DummyData.populateSermons());
    e.addAll(DummyData.populateEvents(p, s, v));
  }

  @override
  Widget build(BuildContext context) {
    final List<EventWidget> eventWidgets = EventWidget.fromList(e);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Events"),
          backgroundColor: Colors.blue[100],
          //leading: Icon(Icons.menu),
        ),
        drawer: AppDrawer(),
        body: ListView(children: eventWidgets),
      ),
    );
  }
}
