import 'package:flutter/material.dart';
import 'theme/basic/basic_app.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BasicApp(),
    );
  }
}
