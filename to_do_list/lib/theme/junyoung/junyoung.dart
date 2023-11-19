import 'package:flutter/material.dart';
import 'package:to_do_list/main_junyoung.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'list_11.dart';
import 'memo_11.dart';
import 'month_11.dart';
import '../../settings.dart';

class BasicApp extends StatefulWidget {
  const BasicApp({Key? key}) : super(key: key);
  static String selectedFontFamilly = 'Nunito';

  @override
  BasicAppState createState() => BasicAppState();
}

class BasicAppState extends State<BasicApp> {
  int _selectedIndex = 1;
  bool isDarkMode = false;
  int selectedFont = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      const MenuMemo(),
      const MenuMonth(),
      const MenuList()
    ];

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: SizedBox(
          width: 20,
          height: 20,
          child: Row(
            children: [
              IconButton(
                padding: const EdgeInsets.only(
                    left: 12, top: 8, right: 8, bottom: 8), // 패딩 설정
                icon: const Icon(Icons.dark_mode, color: Colors.black),
                onPressed: () {
                  setState(() {
                    isDarkMode = !isDarkMode;
                    ThemeJunyoung.themeNotifier.value =
                        isDarkMode ? ThemeMode.dark : ThemeMode.light;
                  });
                },
              ),
              IconButton(
                padding: const EdgeInsets.all(8), // 패딩 설정
                icon: const Icon(Icons.font_download, color: Colors.black),
                onPressed: () {
                  setState(() {
                    selectedFont++;
                    switch (selectedFont % 3) {
                      case 0:
                        BasicApp.selectedFontFamilly = 'Nunito';
                      case 1:
                        BasicApp.selectedFontFamilly = 'OpenSans';
                      case 2:
                        BasicApp.selectedFontFamilly = 'Oswald';
                    }
                  });
                },
              ),
            ],
          ),
        ),
        title: Text('TODOLIST',
            style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontFamily: BasicApp.selectedFontFamilly,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        actions: [
          DropdownButtonHideUnderline(
              child: DropdownButton2(
            customButton: const Icon(
              Icons.settings,
              color: Colors.black,
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
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
            dropdownStyleData: const DropdownStyleData(
              maxHeight: 200,
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
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 5,
        shadowColor: Colors.grey.withOpacity(0.5),
      ),
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
            BasicApp.selectedFontFamilly = BasicApp.selectedFontFamilly;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.draw),
            label: 'Memo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ballot),
            label: 'List',
          ),
        ],
      ),
    );
  }
}
