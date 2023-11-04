import 'package:flutter/material.dart';

import 'list_12.dart';

import 'week_12.dart';

import 'month_12.dart';

class JiwonApp extends StatefulWidget {
  const JiwonApp({Key? key}) : super(key: key);

  @override
  JiwonAppState createState() => JiwonAppState();
}

class JiwonAppState extends State<JiwonApp> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      MenuWeek12(),
      MenuMonth12(),
      const MenuList12()
    ];

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {},
          ),
          title: const Text('TODOLIST',
              style: TextStyle(
                  color: Color.fromARGB(255, 135, 182, 218),
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings,
                  color: Color.fromARGB(255, 0, 0, 0)),
              onPressed: () {},
            )
          ],
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          surfaceTintColor: Colors.white,
          elevation: 5,
          shadowColor: Colors.black,
        ),
        body: Center(
          child: widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: 'Week',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view),
              label: 'Month',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ballot),
              label: 'List',
            ),
          ],
        ));
  }
}
