import 'package:TruthTracker/features/venue/domain/entities/venue.dart';
import 'package:flutter/material.dart';

class VenueField extends StatelessWidget {
  final List<Venue> venues;
  final void Function(Venue) onSelected;

  const VenueField({required this.venues, required this.onSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Venue>(
      displayStringForOption: (option) => option.name,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<Venue>.empty();
        }

        return venues.where(
          (church) => church.name.toLowerCase().contains(
            textEditingValue.text.toLowerCase(),
          ),
        );
      },
      onSelected: onSelected,
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          decoration: const InputDecoration(labelText: "Igreja"),
        );
      },
    );
  }
}
