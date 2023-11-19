import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuMemo extends StatefulWidget {
  const MenuMemo({Key? key}) : super(key: key);

  @override
  MenuMemoState createState() => MenuMemoState();
}

class MenuMemoState extends State<MenuMemo> {
  String? memo;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> _loadData() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      memo = prefs.getString("memo") ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: TextEditingController(text: memo),
            onChanged: (text) {
              setState(() {
                memo = text;
              });
            },
            maxLines: null,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Add memo',
            ),
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _prefs.then((SharedPreferences prefs) {
                prefs.setString("memo", memo!);
              });
            });
          },
          child: const Text('save'),
        ),
      ),
    ]);
  }
}
