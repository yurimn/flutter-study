import 'package:flutter/material.dart';

class MenuMonth extends StatefulWidget {
  const MenuMonth({Key? key}) : super(key: key);

  @override
  MenuMonthState createState() => MenuMonthState();
}

class MenuMonthState extends State<MenuMonth> {
  @override
  Widget build(BuildContext context) {
    return const Text("Month");
  }
}


/*

// month.dart
import 'package:flutter/material.dart';
Widget MenuMonth() {
  return const Text("Month");
}

// week.dart
import 'package:flutter/material.dart';
Widget MenuWeek() {
  return const Text("Week");
}

// list.dart
import 'package:flutter/material.dart';
Widget MenuList() {
  return const Text("List");
}

*/
