import 'package:TruthTracker/features/event/domain/enums/event_category.dart';
import 'package:flutter/material.dart';

class EventCategoryField extends StatelessWidget {
  final EventCategory? value;
  final ValueChanged<EventCategory> onChanged;

  const EventCategoryField({super.key, this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DropdownMenu<EventCategory>(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        width: double.infinity,
        initialSelection: value,
        label: Text("Category"),
        dropdownMenuEntries: EventCategory.values.map((type) {
          return DropdownMenuEntry<EventCategory>(
            value: type,
            label: type.label,
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
