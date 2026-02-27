import 'package:TruthTracker/core/layout/app_drawer.dart';
import 'package:TruthTracker/features/venue/domain/entities/venue.dart';
import 'package:TruthTracker/features/venue/presentation/church_widget.dart';
import 'package:TruthTracker/core/data/dummy_data.dart';
import 'package:flutter/material.dart';

class ChurchPage extends StatelessWidget {
  final List<Venue> c = DummyData.populateVenues();

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
