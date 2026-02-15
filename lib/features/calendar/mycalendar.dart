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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Calendar")),
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
