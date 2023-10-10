StatelessWidget & MaterialApp & Scaffold

```dart:main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

```

StatefullWidget

```dart:main.dart
import 'package:flutter/material.dart';
import 'theme/basic/basic_app.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BasicApp(),
    );
  }
}

```

```dart:basic_app.dart
import 'package:flutter/material.dart';

class BasicApp extends StatefulWidget {
  const BasicApp({Key? key}) : super(key: key);

  @override
  _BasicAppState createState() => _BasicAppState();
}

class _BasicAppState extends State<BasicApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic App'),
      ),
      body: const Center(
        child: Text('Basic App'),
      ),
    );
  }
}
```

Scaffold

```dart:basic_app.dart
class BasicAppState extends State<BasicApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic App'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(
        child: Text('Basic App'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
      ),
    );
  }
}

```

Container

```dart:basic_app.dart
class BasicAppState extends State<BasicApp> {
  int _selectedIndex = 1;

  final List<Widget> _widgetOptions = <Widget>[
    const Text('Index 0: Week'),
    const Text('Index 1: Month'),
    const Text('Index 2: List'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic App'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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

```

Layout

```dart:basic_app.dart
import 'package:flutter/material.dart';

class BasicApp extends StatefulWidget {
  const BasicApp({Key? key}) : super(key: key);

  @override
  BasicAppState createState() => BasicAppState();
}

class BasicAppState extends State<BasicApp> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      menuWeek(),
      menuMonth(),
      menuList(context),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic App'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
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

```
