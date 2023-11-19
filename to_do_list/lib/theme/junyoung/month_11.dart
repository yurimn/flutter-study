import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

import 'util.dart';
import 'junyoung.dart';

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
  List<String> selectedEvent = [];
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
      ),
      const SizedBox(height: 8.0),
      Expanded(
          child: ListView.builder(
              itemCount: listComponent.length,
              itemBuilder: (BuildContext context, int index) {
                final data = jsonDecode(listComponent[index]);
                final DateTime startDate = DateTime.parse(data[2]);
                final DateTime endDate = DateTime.parse(data[3]);
                String tempString = "";
                if (startDate.toString().substring(0, 10) ==
                    _focusedDay.toString().substring(0, 10)) {
                  tempString +=
                      ", start: ${startDate.toString().substring(11, 16)}";
                }
                if (endDate.toString().substring(0, 10) ==
                    _focusedDay.toString().substring(0, 10)) {
                  tempString +=
                      ", due: ${endDate.toString().substring(11, 16)}";
                }

                if ((startDate.compareTo(_focusedDay
                            .add(const Duration(hours: 23, minutes: 59))) ==
                        -1) &&
                    (endDate.compareTo(_focusedDay) == 1)) {
                  return Card(
                      child: ListTile(
                          title: Text(data[0] + tempString,
                              style: TextStyle(
                                  fontFamily: BasicApp.selectedFontFamilly)),
                          subtitle: Text(data[1],
                              style: TextStyle(
                                  fontFamily: BasicApp.selectedFontFamilly)),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return viewToDoDialog(context, data);
                                });
                          }));
                } else {
                  return const SizedBox();
                }
              }))
    ]);
  }
}
