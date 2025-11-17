import 'package:TruthTracker/core/layout/app_drawer.dart';
import 'package:TruthTracker/features/church/data/church.dart';
import 'package:TruthTracker/features/church/presentation/church_widget.dart';
import 'package:TruthTracker/core/data/dummy_data.dart';
import 'package:flutter/material.dart';

class ChurchPage extends StatelessWidget {
  final List<Church> c = DummyData.populateChurches();

  @override
  Widget build(BuildContext context) {
    final List<ChurchWidget> cWidgets = ChurchWidget.fromList(c);

    return Scaffold(
      appBar: AppBar(title: Text('Chuches'), backgroundColor: Colors.blue[100]),
      drawer: AppDrawer(),
      body: ListView(children: cWidgets),
    );
  }
}
