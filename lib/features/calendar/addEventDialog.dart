import 'package:TruthTracker/features/event/domain/entities/event.dart';
import 'package:flutter/material.dart';

class AddEventDialog extends StatelessWidget {
  final DateTime day;
  final Function(Event) onSave;

  const AddEventDialog({super.key, required this.day, required this.onSave});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
