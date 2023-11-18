import 'package:flutter/material.dart';
import 'junyoung.dart';

class MenuWeek extends StatefulWidget {
  const MenuWeek({Key? key}) : super(key: key);

  @override
  MenuWeekState createState() => MenuWeekState();
}

class MenuWeekState extends State<MenuWeek> {
  @override
  Widget build(BuildContext context) {
    return Text("Week",
        style: TextStyle(fontFamily: BasicApp.selectedFontFamilly));
  }
}
