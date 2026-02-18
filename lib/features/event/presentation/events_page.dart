import 'package:TruthTracker/core/layout/app_drawer.dart';
import 'package:TruthTracker/features/church/domain/entities/church.dart';
import 'package:TruthTracker/features/event/domain/entities/event.dart';
import 'package:TruthTracker/features/event/presentation/event_widget.dart';
import 'package:TruthTracker/features/preacher/data/preacher.dart';
import 'package:TruthTracker/features/sermon/data/sermon.dart';
import 'package:TruthTracker/core/data/dummy_data.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  final List<Preacher> p;
  final List<Sermon> s;
  final List<Church> c;
  final List<Event> e;

  EventsPage() : c = [], p = DummyData.populatePreachers(), s = [], e = [] {
    c.addAll(DummyData.populateChurches());
    s.addAll(DummyData.populateSermons(p));
    e.addAll(DummyData.populateEvents(p, s, c));
  }

  @override
  Widget build(BuildContext context) {
    final List<EventWidget> paWidgets = EventWidget.fromList(e);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Events"),
          backgroundColor: Colors.blue[100],
          //leading: Icon(Icons.menu),
        ),
        drawer: AppDrawer(),
        body: ListView(children: paWidgets),
      ),
    );
  }
}
