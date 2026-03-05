import 'package:TruthTracker/features/event/domain/enums/event_category.dart';
import 'package:flutter/material.dart';

class EventTypeField extends StatelessWidget {
  final EventCategory value;
  final ValueChanged<EventCategory> onChanged;

  const EventTypeField({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<EventCategory>(
      initialSelection: value,
      label: const Text("Tipo"),
      dropdownMenuEntries: EventCategory.values.map((type) {
        return DropdownMenuEntry<EventCategory>(value: type, label: type.label);
      }).toList(),
      onSelected: (value) {
        if (value != null) {
          onChanged(value);
        }
      },
    );
  }
}
