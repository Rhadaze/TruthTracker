import 'package:TruthTracker/features/calendar/presentation/my_calendar.dart';
import 'package:TruthTracker/features/event/presentation/widgets/church_field.dart';
import 'package:TruthTracker/features/event/presentation/widgets/event_type_field.dart';
import 'package:TruthTracker/features/event/presentation/widgets/preacher_Field.dart';
import 'package:TruthTracker/features/event/presentation/widgets/sermon_field.dart';
import 'package:TruthTracker/features/church/domain/entities/church.dart';
import 'package:TruthTracker/features/event/domain/entities/event.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type.dart';
import 'package:TruthTracker/features/preacher/domain/entities/preacher.dart';
import 'package:TruthTracker/features/sermon/domain/entities/sermon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddEventDialog extends StatefulWidget {
  final DateTime day;
  final Function(Event) onSave;

  const AddEventDialog({super.key, required this.day, required this.onSave});

  @override
  State<AddEventDialog> createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {
  final TextEditingController churchController = TextEditingController();
  final TextEditingController sermonController = TextEditingController();
  final TextEditingController preacherController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  EventType selectedType = EventType.saturdayMorning;

  final List<Preacher> _preachers = [
    Preacher(name: "João"),
    Preacher(name: "Carlos"),
  ];

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd/MM/yyyy').format(widget.day);

    return AlertDialog(
      title: Text("Novo Evento - $formattedDate"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ChurchField(churchController),
            SizedBox(height: 16),
            SermonField(sermonController),
            SizedBox(height: 16),
            PreacherField(preacherController),
            SizedBox(height: 20),
            EventTypeField(
              value: selectedType,
              onChanged: (newValue) {
                selectedType = newValue;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancelar"),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              //aqui salva o evento
              final newEvent = Event(
                church: Church(name: churchController.text),
                date: widget.day,
                preacher: Preacher(name: preacherController.text),
                sermon: Sermon(theme: sermonController.text),
                type: selectedType,
              );

              widget.onSave(newEvent);
              Navigator.pop(context);
            }
          },
          child: Text("Salvar"),
        ),
      ],
    );
  }
}
