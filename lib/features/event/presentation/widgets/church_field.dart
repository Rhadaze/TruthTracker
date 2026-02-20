import 'package:TruthTracker/features/church/domain/entities/church.dart';
import 'package:flutter/material.dart';

class ChurchField extends StatelessWidget {
  final List<Church> churches;
  final void Function(Church) onSelected;

  const ChurchField({
    required this.churches,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Church>(
      displayStringForOption: (option) => option.name,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<Church>.empty();
        }

        return churches.where(
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
          decoration: const InputDecoration(labelText: "Church"),
        );
      },
    );
  }
}
