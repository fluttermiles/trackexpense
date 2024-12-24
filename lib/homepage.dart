import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime focusedDate = DateTime.now(); // Currently focused date
  DateTime? selectedDate; // Currently selected date

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monthly Calender'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: focusedDate,
            daysOfWeekHeight: 25,
            selectedDayPredicate: (day) => isSameDay(selectedDate, day),
            calendarStyle: CalendarStyle(
              tablePadding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              // Customize the selected day appearance
              selectedDecoration: BoxDecoration(
                color: Colors.green, // Green color for the selected day
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.blueAccent, // Different color for the current day
                shape: BoxShape.circle,
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              // Customize the days of the week to be bold
              weekdayStyle: const TextStyle(
                fontWeight: FontWeight.bold, // Bold for weekdays
                fontSize: 16,
              ),
              weekendStyle: const TextStyle(
                fontWeight: FontWeight.bold, // Bold for weekends
                fontSize: 16,
                color: Colors.red, // Optional: Make weekends a different color
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false, // Hides the format toggle button
              titleCentered: true,
              headerPadding: const EdgeInsets.symmetric(vertical: 8.0),
              titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                selectedDate = selectedDay; // Update selected day
                focusedDate = focusedDay; // Update focused day
              });
              log('$selectedDay $focusedDay');
            },
          ),
        ],
      ),
    );
  }
}
