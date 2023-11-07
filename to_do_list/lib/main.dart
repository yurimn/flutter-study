import 'package:flutter/material.dart';
import 'theme/basic/basic_app.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const BasicApp(),
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ));
  }
}
