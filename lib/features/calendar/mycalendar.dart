import 'package:TruthTracker/core/data/dummy_data.dart';
import 'package:TruthTracker/core/extensions/event_type_extension.dart';
import 'package:TruthTracker/features/church/domain/entities/church.dart';
import 'package:TruthTracker/features/event/domain/entities/event.dart';
import 'package:TruthTracker/features/event/domain/enums/event_type.dart';
import 'package:TruthTracker/features/preacher/data/preacher.dart';
import 'package:TruthTracker/features/sermon/data/sermon.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class MyCalendar extends StatefulWidget {
  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final List<Event> _de = DummyData.populateData();

  final Map<DateTime, List<Event>> _events = {};

  List<Event> _getEventsForDay(DateTime day) {
    return _events[DateTime.utc(day.year, day.month, day.day)] ?? [];
  }

  void _addEvent(DateTime day, Event event) {
    final normalizedDay = DateTime.utc(day.year, day.month, day.day);

    setState(() {
      _events.putIfAbsent(normalizedDay, () => []);
      _events[normalizedDay]!.add(event);
    });
  }

  void _showAddEventDialog(DateTime day) {
    final TextEditingController churchController = TextEditingController();
    final TextEditingController sermonController = TextEditingController();
    final TextEditingController preacherController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    EventType selectedType = EventType.saturdayMorning;
    final formattedDate = DateFormat('dd/MM/yyyy').format(day);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Novo Evento - $formattedDate"),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ChurchField(churchController),
              SizedBox(height: 12),
              SermonField(sermonController),
              SizedBox(height: 12),
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
                _addEvent(
                  day,
                  Event(
                    church: Church(name: churchController.text),
                    date: day,
                    preacher: Preacher(name: preacherController.text),
                    sermon: Sermon(theme: sermonController.text),
                    type: selectedType,
                  ), //TODO tenho que por funcao pra buscar opcao criada, SENAO, criar uma nova.
                );
                churchController.clear();
                sermonController.clear();
                preacherController.clear();
                Navigator.pop(context);
              }
            },
            child: Text("Salvar"),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    for (var event in _de) {
      final normalizedDay = DateTime.utc(
        event.date.year,
        event.date.month,
        event.date.day,
      );

      _events.putIfAbsent(normalizedDay, () => []);
      _events[normalizedDay]!.add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Eventos")),
      body: Column(
        children: [
          TableCalendar(
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),

            firstDay: DateTime.utc(2020),
            lastDay: DateTime.utc(2030),
            focusedDay: _focusedDay,

            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),

            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },

            eventLoader: _getEventsForDay,
          ),
          Divider(),
          ..._getEventsForDay(_selectedDay ?? _focusedDay).map(
            (event) =>
                ListTile(title: Text(event.preacher?.name ?? "sem pregador")),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _selectedDay == null
            ? null
            : () => _showAddEventDialog(_selectedDay!),
        child: Icon(Icons.add),
      ),
    );
  }
}

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

class EventTypeField extends StatelessWidget {
  final EventType value;
  final ValueChanged<EventType> onChanged;

  const EventTypeField({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<EventType>(
      initialSelection: value,
      label: const Text("Tipo"),
      dropdownMenuEntries: EventType.values.map((type) {
        return DropdownMenuEntry<EventType>(value: type, label: type.label);
      }).toList(),
      onSelected: (value) {
        if (value != null) {
          onChanged(value);
        }
      },
    );
  }
}
