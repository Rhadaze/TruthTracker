import 'package:flutter/material.dart';

class PreacherField extends StatelessWidget {
  final TextEditingController controller;

  const PreacherField(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: "Pregador"),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Informe o Pregador";
        }
        if (value.length < 3) {
          return "Mínimo 3 caracteres";
        }
        return null;
      },
    );
  }
}
