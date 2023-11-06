import 'package:flutter/material.dart';
import 'util.dart';

class MenuList8 extends StatefulWidget {
  const MenuList8({Key? key}) : super(key: key);

  @override
  MenuListState createState() => MenuListState();
}

class MenuListState extends State<MenuList8> {
  List listComponent = [
    menuComponent("title1", "content1"),
    menuComponent("title2", "content2"),
    menuComponent("title3", "content3"),
    menuComponent("title4", "content4"),
  ];
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
                      return addToDoDialog(context,
                          (String title, String content) {
                        setState(() {
                          listComponent.add(menuComponent(title, content));
                        });
                      });
                    });
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(209, 101, 130, 135),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            child:
                const Icon(Icons.add, color: Color.fromARGB(255, 61, 61, 104)),
          ));
    }

    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            addButton(),
            ...listComponent,
          ],
        ));
  }
}

Widget menuComponent(String title, String content) {
  return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
          height: 50,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color.fromARGB(209, 227, 246, 250),
            border:
                Border.all(color: Color.fromARGB(255, 61, 61, 104), width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(children: [
            SizedBox(
              child: Row(
                children: [
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(width: 10),
                  Text(content),
                ],
              ),
            ),
            const Icon(Icons.delete, color: Color.fromARGB(255, 130, 130, 130)),
          ])));
}
