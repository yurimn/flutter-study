import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

import 'util.dart';

class MenuMonth extends StatefulWidget {
  const MenuMonth({Key? key}) : super(key: key);

  @override
  MenuMonthState createState() => MenuMonthState();
}

class MenuMonthState extends State<MenuMonth> {
  final kToday = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<String> listComponent = [];

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> _loadData() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      listComponent = prefs.getStringList("listComponent") ?? [];
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 10,
      ),
      TableCalendar(
        firstDay: DateTime(kToday.year, kToday.month - 3, kToday.day),
        lastDay: DateTime(kToday.year, kToday.month + 3, kToday.day),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
        // style
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            color: Color.fromARGB(120, 64, 95, 135),
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: Color.fromARGB(220, 64, 95, 135),
            shape: BoxShape.circle,
          ),
        ),
      ),
      const SizedBox(height: 8.0),
      Expanded(
          child: ListView.builder(
              itemCount: listComponent.length,
              itemBuilder: (BuildContext context, int index) {
                final data = jsonDecode(listComponent[index]);
                final DateTime startDate = DateTime.parse(data[2]);
                final DateTime endDate = DateTime.parse(data[3]);

                if ((startDate.isBefore(_focusedDay) &&
                        endDate.add(Duration(days: 1)).isAfter(_focusedDay)) ||
                    startDate.isAtSameMomentAs(_focusedDay) ||
                    endDate
                        .add(Duration(days: 1))
                        .isAtSameMomentAs(_focusedDay)) {
                  return Card(
                      child: ListTile(
                          title: Text(data[0]),
                          subtitle: Text(data[1]),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return viewToDoDialog(context, data);
                                });
                          }));
                }
              }))
    ]);
  }
}
