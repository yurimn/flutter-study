import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'util.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  MenuListState createState() => MenuListState();
}

class MenuListState extends State<MenuList> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<String> listComponent = [];
  Future<void> _loadData() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      listComponent = prefs.getStringList("listComponent") ?? [];
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    Widget addButton() {
      return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AddToDoDialog(add: (String title, String content,
                          String startDate, String endDate) async {
                        final SharedPreferences prefs = await _prefs;
                        setState(() {
                          listComponent.add(
                              jsonEncode([title, content, startDate, endDate]));
                          prefs.setStringList("listComponent", listComponent);
                        });
                      });
                    });
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 130, 130, 130),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ));
    }

    Widget deleteButton(int index, Function() onPressed) {
      return IconButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(const CircleBorder()),
            iconSize: MaterialStateProperty.all(25),
            alignment: Alignment.center),
        padding: const EdgeInsets.all(0),
        icon: const Icon(Icons.delete, color: Colors.grey),
      );
    }

    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            addButton(),
            listComponent.isEmpty
                ? const Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: Text("No schedule",
                        style: TextStyle(fontSize: 20, color: Colors.grey)),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: listComponent.length,
                    itemBuilder: (BuildContext context, int index) {
                      return menuComponent(
                          context,
                          listComponent[index],
                          deleteButton(index, () async {
                            final SharedPreferences prefs = await _prefs;
                            setState(() {
                              listComponent.removeAt(index);
                              prefs.setStringList(
                                  "listComponent", listComponent);
                            });
                          }));
                    })
          ],
        ));
  }
}

Widget menuComponent(BuildContext context, content, Widget deleteButton) {
  List listContent = jsonDecode(content);

  return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return viewToDoDialog(context, listContent);
                });
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          child: Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: const Color.fromARGB(255, 130, 130, 130),
                    width: 1.5),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Text(listContent[0],
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(width: 10),
                  Text(listContent[1]),
                  const Spacer(),
                  deleteButton
                ],
              ))));
}
