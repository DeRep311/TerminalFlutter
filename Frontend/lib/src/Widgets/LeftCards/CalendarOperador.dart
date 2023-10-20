// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarOperador extends StatefulWidget {
  const CalendarOperador({super.key});

  @override
  State<CalendarOperador> createState() => _CalendarState();
}

class _CalendarState extends State<CalendarOperador> {
  @override
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(hours: 6)).then((_) {
      if (mounted) setState(() {});
    });
    return TableCalendar(
      availableCalendarFormats: const {
        CalendarFormat.month: 'Mes',
        CalendarFormat.week: 'Semana',
      },
      locale: 'en_US',
      calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          weekendTextStyle: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.normal),
          weekNumberTextStyle:
              TextStyle(color: Color(0xFFFFFFFF), fontSize: 14),
          todayDecoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          selectedDecoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          selectedTextStyle: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 14,
              fontWeight: FontWeight.normal),
          todayTextStyle: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 14,
              fontWeight: FontWeight.normal),
          defaultTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.normal)),
      daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.normal),
          weekendStyle: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.normal)),
      calendarFormat: CalendarFormat.month,
      rowHeight: 40.0, // Adjust this value to change the row height
      daysOfWeekHeight:
          20.0, // Adjust this value to change the days of week height
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
      headerStyle: HeaderStyle(
          leftChevronIcon: Icon(Icons.arrow_back_ios, color: Colors.white),
          rightChevronIcon: Icon(Icons.arrow_forward_ios, color: Colors.white),
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(color: Colors.white)),
    );
  }
}
