import 'package:TruthTracker/core/data/dummy_data.dart';
import 'package:TruthTracker/core/ui/app_snackbar.dart';
import 'package:TruthTracker/features/event/domain/value_objects/event_type.dart';
import 'package:TruthTracker/features/event/presentation/widgets/cancel_button.dart';
import 'package:TruthTracker/features/event/presentation/widgets/church_field.dart';
import 'package:TruthTracker/features/event/presentation/widgets/event_category_field.dart';
import 'package:TruthTracker/features/event/presentation/widgets/event_type_field.dart';
import 'package:TruthTracker/features/event/presentation/widgets/preacher_Field.dart';
import 'package:TruthTracker/features/event/presentation/widgets/save_button.dart';
import 'package:TruthTracker/features/event/presentation/widgets/sermon_field.dart';
import 'package:TruthTracker/features/venue/domain/entities/venue.dart';
import 'package:TruthTracker/features/event/domain/entities/event.dart';
import 'package:TruthTracker/features/event/domain/enums/event_category.dart';
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
  final TextEditingController venueController = TextEditingController();
  final TextEditingController sermonController = TextEditingController();
  final TextEditingController preacherController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Preacher? selectedPreacher;
  Venue? selectedVenue;
  Sermon? selectedSermon;
  EventCategory? selectedCategory;
  EventType? selectedType; // = EventType.service;

  final List<Preacher> _preachers = DummyData.populatePreachers();
  final List<Venue> _venues = DummyData.populateVenues();
  final List<Sermon> _sermons = DummyData.populateSermons();

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd/MM/yyyy').format(widget.day);

    return AlertDialog(
      title: Column(
        children: [
          SizedBox(height: 10),
          Text("Novo Evento   $formattedDate"),
          SizedBox(height: 20),
        ],
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PreacherField(
                  preachers: _preachers,
                  onSelected: (preacher) => selectedPreacher = preacher,
                ),
                SizedBox(height: 20),
                VenueField(
                  venues: _venues,
                  onSelected: (venue) => selectedVenue = venue,
                ),
                SizedBox(height: 20),
                SermonField(
                  sermons: _sermons,
                  onSelected: (sermon) => selectedSermon = sermon,
                ),
                SizedBox(height: 20),
                EventCategoryField(
                  value: selectedCategory,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue;
                      selectedType = null;
                    });
                  },
                ),
                SizedBox(height: 20),
                EventTypeField(
                  category: selectedCategory,
                  value: selectedType,
                  onChanged: (newValue) {
                    selectedType = newValue;
                  },
                ),
              ],
            ),
          ),
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
      id: 1, //dummy do dummy esse id aqui
      venue: selectedVenue!,
      date: widget.day,
      preacher: selectedPreacher!,
      sermon: selectedSermon,
      type: selectedType,
    );
  }

  void _handleSave() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (selectedPreacher == null) {
      AppSnackbar.showPreacherFieldError(context);
      return;
    }

    if (selectedVenue == null) {
      AppSnackbar.showVenueFieldError(context);
      return;
    }

    final newEvent = createNewEvent();
    widget.onSave(newEvent);
    Navigator.pop(context);
  }
}
