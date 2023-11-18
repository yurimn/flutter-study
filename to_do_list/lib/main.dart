import 'package:flutter/material.dart';
import 'package:to_do_list/theme/dahye/theme.dart';
import 'theme/dahye/dahye.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DahyeApp(),
      theme: MyThemeData.lightThemeData,
    );
  }
}
