import 'package:flutter/material.dart';

class ChurchField extends StatelessWidget {
  final TextEditingController controller;

  const ChurchField(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: "Igreja"),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Informe a igreja";
        }
        if (value.length < 3) {
          return "Mínimo 3 caracteres";
        }
        return null;
      },
    );
  }
}
