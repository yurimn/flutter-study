import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

import 'main_basic.dart';
import 'main_junyoung.dart';
import 'main_dahye.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => SettingState();
}

class SettingState extends State<Setting> {
  Widget themeButton(String name, Widget themeWidget) {
    return ElevatedButton(
      onPressed: () {
        final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
        Future<void> saveTheme(String theme) async {
          final SharedPreferences _prefs = await prefs;
          _prefs.setString("theme", theme);
        }

        saveTheme(name).then((val) {
          runApp(themeWidget);
        });
      },
      child: Text(name),
    );
  }

  Widget privewButton(String name, String imagePath, Widget themeWidget) {
    return Column(children: [
      const SizedBox(
        height: 10,
      ),
      Text(name,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      const SizedBox(
        height: 10,
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => themeWidget),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.width * 0.8 * 205 / 436,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
                spreadRadius: 0.0,
                offset: Offset(1.0, 1.0), // shadow direction: bottom right
              )
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Setting",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text("Theme",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  themeButton("Basic", const ThemeBasic()),
                  const SizedBox(width: 5),
                  themeButton("Junyoung", const ThemeJunyoung()),
                  const SizedBox(width: 5),
                  themeButton("Dahye", const ThemeDahye()),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text("Preview",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              privewButton(
                  "Basic", "assets/images/basic.png", const ThemeBasic()),
              privewButton("Junyoung", "assets/images/junyoung.png",
                  const ThemeJunyoung()),
              privewButton(
                  "Dahye", "assets/images/dahye.png", const ThemeDahye()),
            ],
          ),
        ));
  }
}
