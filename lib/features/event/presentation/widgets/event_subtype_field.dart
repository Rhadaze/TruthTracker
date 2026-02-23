import 'package:TruthTracker/core/extensions/enum_label_extension.dart';
import 'package:TruthTracker/core/extensions/event_type_extension.dart';
import 'package:TruthTracker/core/extensions/event_type_service_extension.dart';
import 'package:TruthTracker/core/extensions/event_type_talk_extension.dart';
import 'package:TruthTracker/core/extensions/event_type_teaching_extension.dart';
import 'package:TruthTracker/core/extensions/event_type_visit_extension.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type_service.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type_talk.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type_teaching.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type_visit.dart';
import 'package:flutter/material.dart';

class EventSubtypeField extends StatelessWidget {
  final EventType? category;
  final Enum? value;
  final ValueChanged<Enum> onChanged;

  const EventSubtypeField({
    super.key,
    required this.category,
    this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final subtypes = category?.subtypes ?? [];

    return SizedBox(
      width: double.infinity,
      child: DropdownMenu<Enum>(
        enabled: category != null,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        width: double.infinity,
        initialSelection: value,
        label: Text("Tipo"),
        dropdownMenuEntries: subtypes.map((subtype) {
          return DropdownMenuEntry<Enum>(
            value: subtype,
            label: switch (subtype) {
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
