import 'package:TruthTracker/features/event/domain/enums/event_category.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type_service.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type_talk.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type_teaching.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type_visit.dart';
import 'package:TruthTracker/features/event/domain/value_objects/event_type.dart';
import 'package:flutter/material.dart';

class EventTypeField extends StatelessWidget {
  final EventCategory? category;
  final EventType? value;
  final ValueChanged<EventType> onChanged;

  const EventTypeField({
    super.key,
    required this.category,
    this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final types = category?.types ?? <EventType>[];

    return SizedBox(
      width: double.infinity,
      child: DropdownMenu<EventType>(
        enabled: category != null,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        width: double.infinity,
        initialSelection: value,
        label: Text("Tipo"),
        dropdownMenuEntries: types.map((type) {
          return DropdownMenuEntry<EventType>(
            value: type,
            label: switch (type) {
              EventTypeService s => s.label,
              EventTypeTalk t => t.label,
              EventTypeTeaching t => t.label,
              EventTypeVisit v => v.label,
              _ => "Nenhuma opção encontrada",
            },
          );
        }).toList(),
        onSelected: (value) {
          if (value != null) {
            onChanged(value);
          }
        },
      ),
    );
  }
}
