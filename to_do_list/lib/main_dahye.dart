import 'package:flutter/material.dart';
import 'package:to_do_list/theme/dahye/theme.dart';
import 'theme/dahye/dahye.dart';

class ThemeDahye extends StatelessWidget {
  const ThemeDahye({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DahyeApp(),
      theme: MyThemeData.lightThemeData,
    );
  }
}
