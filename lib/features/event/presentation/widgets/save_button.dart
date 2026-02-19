import 'package:TruthTracker/features/event/domain/entities/event.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Event Function() createNewEvent;
  final Function(Event) onSave;

  const SaveButton({
    super.key,
    required this.formKey,
    required this.createNewEvent,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          //aqui salva o evento
          final newEvent = createNewEvent();
          onSave(newEvent);
          Navigator.pop(context);
        }
      },
      child: const Text("Salvar"),
    );
  }
}
