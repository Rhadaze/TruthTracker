import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MyCalendar extends StatefulWidget {
  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final Map<DateTime, List<String>> _events = {
    DateTime.utc(2026, 2, 15): ['Culto Sábado'],
    DateTime.utc(2026, 2, 20): ['Culto Quarta-feira'],
  };

  List<String> _getEventsForDay(DateTime day) {
    return _events[DateTime.utc(day.year, day.month, day.day)] ?? [];
  }

  void _addEvent(DateTime day, String event) {
    final normalizedDay = DateTime.utc(day.year, day.month, day.day);

    setState(() {
      if (_events[normalizedDay] == null) {
        _events[normalizedDay] = [];
      }
      _events[normalizedDay]!.add(event);
    });
  }

  void _showAddEventDialog(DateTime day) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Novo Evento"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "Digite o evento"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _addEvent(day, controller.text);
              Navigator.pop(context);
            },
            child: Text("Salvar"),
          ),
        ],
      ),
    );
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
          ..._getEventsForDay(
            _selectedDay ?? _focusedDay,
          ).map((event) => ListTile(title: Text(event))),
        ],
      ),
    );
  }
}
