import 'package:TruthTracker/features/preacher/data/preacher.dart';
import 'package:TruthTracker/core/layout/app_drawer.dart';
import 'package:TruthTracker/core/data/dummy_data.dart';
import 'package:TruthTracker/features/preacher/presentation/preacher_widget.dart';
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
