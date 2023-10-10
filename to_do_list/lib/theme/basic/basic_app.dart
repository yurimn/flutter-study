import 'package:flutter/material.dart';

class BasicApp extends StatefulWidget {
  const BasicApp({Key? key}) : super(key: key);

  @override
  _BasicAppState createState() => _BasicAppState();
}

class _BasicAppState extends State<BasicApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      menuWeek(),
      menuMonth(),
      menuList()
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic App'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          print('Selected index: $index');
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
      ),
    );
  }
}

Widget menuComponent(String title, String content) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(children: [
          Text(title),
          Text(content),
        ])),
  );
}

Widget menuList() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      menuComponent("title1", "content1"),
      menuComponent("title2", "content2"),
      menuComponent("title3", "content3"),
      menuComponent("title4", "content4"),
    ],
  );
}

Widget menuMonth() {
  return const Text('Menu Month');
}

Widget menuWeek() {
  return const Text('Menu Week');
}
