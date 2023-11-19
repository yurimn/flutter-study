import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'main_junyoung.dart';
//import 'main_dahye.dart';
// import 'main_basic.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    Future<void> _loadData() async {
      final SharedPreferences prefs = await _prefs;
    }

    //return const MainApp();
    return const MainApp();
  }
}
