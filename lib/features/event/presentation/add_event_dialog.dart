import 'package:TruthTracker/features/event/presentation/widgets/cancel_button.dart';
import 'package:TruthTracker/features/event/presentation/widgets/church_field.dart';
import 'package:TruthTracker/features/event/presentation/widgets/event_type_field.dart';
import 'package:TruthTracker/features/event/presentation/widgets/preacher_Field.dart';
import 'package:TruthTracker/features/event/presentation/widgets/save_button.dart';
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

  Preacher? selectedPreacher;
  Church? selectedChurch;

  EventType selectedType = EventType.saturdayMorning;

  final List<Preacher> _preachers = [
    Preacher(name: "Marlon"),
    Preacher(name: "Christian"),
    Preacher(name: "Kariston"),
    Preacher(name: "Mateus"),
    Preacher(name: "Célio"),
    Preacher(name: "Bárbara"),
    Preacher(name: "Arhessa"),
  ];

  final List<Church> _churches = [
    Church(name: "Central - Campo Grande"),
    Church(name: "Amambaí"),
    Church(name: "São Francisco"),
    Church(name: "Central - Mogi Mirim"),
    Church(name: "Central - Cuiabá"),
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
            ChurchField(
              churches: _churches,
              onSelected: (church) => selectedChurch = church,
            ),
            SizedBox(height: 20),
            SermonField(sermonController),
            SizedBox(height: 20),
            PreacherField(
              preachers: _preachers,
              onSelected: (preacher) {
                selectedPreacher = preacher;
              },
            ),
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
        CancelButton(),
        SaveButton(onPressed: _handleSave),
      ],
    );
  }

  Event createNewEvent() {
    return Event(
      church: selectedChurch,
      date: widget.day,
      preacher: selectedPreacher,
      sermon: Sermon(theme: sermonController.text),
      type: selectedType,
    );
  }

  void _handleSave() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (selectedChurch == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Selecione uma igreja")));
      return;
    }

    final newEvent = createNewEvent();
    widget.onSave(newEvent);
    Navigator.pop(context);
  }
}
