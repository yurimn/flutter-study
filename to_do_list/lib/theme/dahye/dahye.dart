import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'list_4.dart';
import 'photo.dart';
import 'month_4.dart';
import '../../settings.dart';

class DahyeApp extends StatefulWidget {
  const DahyeApp({Key? key}) : super(key: key);

  @override
  DahyeAppState createState() => DahyeAppState();
}

class DahyeAppState extends State<DahyeApp> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      const MenuPhoto(),
      const MenuMonth(),
      const MenuList(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODOLIST',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(250, 254, 190, 73),
        actions: [
          DropdownButtonHideUnderline(
              child: DropdownButton2(
            customButton: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 28,
            ),
            items: const [
              DropdownMenuItem(
                value: "setting",
                child: SizedBox(
                  width: 100,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Setting",
                      style: TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 47, 86, 114)),
                    ),
                  ),
                ),
              ),
            ],
            dropdownStyleData: const DropdownStyleData(
              width: 100,
            ),
            onChanged: (value) {
              if (value == "setting") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Setting()),
                );
              }
            },
          )),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Center(
          child: widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: 'Photo',
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
          // backgournd color
          backgroundColor: Colors.white),
    );
  }
}
