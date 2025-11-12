import 'package:TruthTracker/Preacher.dart';
import 'package:TruthTracker/app_drawer.dart';
import 'package:TruthTracker/dummy_data.dart';
import 'package:TruthTracker/preacher_widget.dart';
import 'package:flutter/material.dart';

class PreacherPage extends StatelessWidget {
  static final List<Preacher> preachers = DummyData.populatePreachers();

  @override
  Widget build(BuildContext context) {
    final List<PreacherWidget> preacherWidgets = PreacherWidget.fromList(
      preachers,
    );

    return Scaffold(
      appBar: AppBar(title: Text("Preacher")),
      drawer: AppDrawer(),
      body: ListView(children: preacherWidgets),
    );
  }
}
