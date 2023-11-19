import 'package:flutter/material.dart';
import 'theme/basic/basic_app.dart';

class ThemeBasic extends StatelessWidget {
  const ThemeBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BasicApp(),
    );
  }
}
