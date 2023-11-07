import 'package:flutter/material.dart';
import 'theme/Hyungseok/Hyungseok_app.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const HyungseokApp(),
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ));
  }
}
