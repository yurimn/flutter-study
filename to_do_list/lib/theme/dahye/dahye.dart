import 'package:flutter/material.dart';

import 'list_4.dart';
import 'week_4.dart';
import 'month_4.dart';

class DahyeApp extends StatefulWidget {
  const DahyeApp({Key? key}) : super(key: key);

  @override
  DahyeAppState createState() => DahyeAppState();
}

class DahyeAppState extends State<DahyeApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      menuWeek4(),
      menuMonth4(),
      MenuList(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODOLIST',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        centerTitle: true,
        backgroundColor: Colors.purple.shade300,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_kanban),
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
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

Widget menuMonth() {
  return const Text('Month');
}

Widget menuList(context) {
  return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.9,
      color: Colors.blue,
      child:
          const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("number 1"),
        Text("number 2"),
        Text("number 3"),
      ]));
}

Widget menuWeek() {
  return const Text('Week');
}
