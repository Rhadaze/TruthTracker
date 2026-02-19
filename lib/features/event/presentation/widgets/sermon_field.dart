import 'package:flutter/material.dart';

class SermonField extends StatelessWidget {
  final TextEditingController controller;

  const SermonField(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: "Tema"),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Informe o tema";
        }
        if (value.length < 3) {
          return "Mínimo 3 caracteres";
        }
        return null;
      },
    );
  }
}
