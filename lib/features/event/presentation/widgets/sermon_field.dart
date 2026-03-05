import 'package:TruthTracker/features/sermon/domain/entities/sermon.dart';
import 'package:flutter/material.dart';

class SermonField extends StatelessWidget {
  final List<Sermon> sermons;
  final void Function(Sermon) onSelected;

  const SermonField({
    required this.sermons,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Sermon>(
      displayStringForOption: (option) => option.title,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<Sermon>.empty();
        }

        return sermons.where(
          (venue) => venue.title.toLowerCase().contains(
            textEditingValue.text.toLowerCase(),
          ),
        );
      },
      onSelected: onSelected,
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          decoration: const InputDecoration(labelText: "Tema"),
        );
      },
    );
  }
}
