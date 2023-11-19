import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'main_junyoung.dart';
import 'main_dahye.dart';
import 'main_basic.dart';
import 'settings.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  Future<String?> loadTheme() async {
    final SharedPreferences _prefs = await prefs;
    final String? theme = _prefs.getString("theme");
    return theme;
  }

  loadTheme().then((val) {
    if (val.toString() == "null") {
      runApp(const MainApp());
    } else if (val == "junyoung") {
      runApp(const ThemeJunyoung());
    } else if (val == "dahye") {
      runApp(const ThemeDahye());
    } else if (val == "basic") {
      runApp(const ThemeBasic());
    } else {
      runApp(const MainApp());
    }
  }).catchError((err) {
    runApp(const MainApp());
  });

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    ),
  ));
  FlutterNativeSplash.remove();
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: Setting());
  }
}
