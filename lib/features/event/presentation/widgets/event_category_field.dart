import 'package:TruthTracker/core/extensions/event_type_extension.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type.dart';
import 'package:flutter/material.dart';

class EventCategoryField extends StatelessWidget {
  final EventType? value;
  final ValueChanged<EventType> onChanged;

  const EventCategoryField({super.key, this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DropdownMenu<EventType>(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        width: double.infinity,
        initialSelection: value,
        label: Text("Category"),
        dropdownMenuEntries: EventType.values.map((type) {
          return DropdownMenuEntry<EventType>(value: type, label: type.label);
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
