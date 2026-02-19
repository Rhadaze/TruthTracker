import 'package:TruthTracker/core/extensions/event_type_extension.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type.dart';
import 'package:flutter/material.dart';

class EventTypeField extends StatelessWidget {
  final EventType value;
  final ValueChanged<EventType> onChanged;

  const EventTypeField({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<EventType>(
      initialSelection: value,
      label: const Text("Tipo"),
      dropdownMenuEntries: EventType.values.map((type) {
        return DropdownMenuEntry<EventType>(value: type, label: type.label);
      }).toList(),
      onSelected: (value) {
        if (value != null) {
          onChanged(value);
        }
      },
    );
  }
}
