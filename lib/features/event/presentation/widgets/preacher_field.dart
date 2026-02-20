import 'package:TruthTracker/features/preacher/domain/entities/preacher.dart';
import 'package:flutter/material.dart';

class PreacherField extends StatelessWidget {
  final List<Preacher> preachers;
  final void Function(Preacher) onSelected;

  const PreacherField({
    required this.preachers,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Preacher>(
      displayStringForOption: (option) => option.name,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<Preacher>.empty();
        }

        return preachers.where(
          (preacher) => preacher.name.toLowerCase().contains(
            textEditingValue.text.toLowerCase(),
          ),
        );
      },
      onSelected: onSelected,
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          decoration: const InputDecoration(labelText: "Pregador"),
        );
      },
    );

    // return TextFormField(
    //   controller: controller,
    //   decoration: InputDecoration(labelText: "Pregador"),
    //   validator: (value) {
    //     if (value == null || value.trim().isEmpty) {
    //       return "Informe o Pregador";
    //     }
    //     if (value.length < 3) {
    //       return "Mínimo 3 caracteres";
    //     }
    //     return null;
    //   },
    // );
  }
}
