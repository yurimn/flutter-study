import 'package:flutter/material.dart';
import 'package:to_do_list/theme/basic/basic_app.dart';
import 'util.dart';

class MenuList12 extends StatefulWidget {
  const MenuList12({Key? key}) : super(key: key);

  @override
  MenuListState createState() => MenuListState();
}

List listComponent = [
  menuComponent("title1", "content1"),
  menuComponent("title2", "content2"),
  menuComponent("title3", "content3"),
  menuComponent("title4", "content4"),
];

class MenuListState extends State<MenuList12> {
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
              backgroundColor: Color.fromARGB(255, 170, 206, 240),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            child: const Icon(Icons.add,
                color: Color.fromARGB(255, 255, 255, 255)),
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

Widget menuComponent(
  String title,
  String content,
) {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 50,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 133, 188, 239),
            border: Border.all(
                color: Color.fromARGB(255, 255, 255, 255), width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(children: [
            SizedBox(
              child: Row(
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255))),
                  const SizedBox(width: 10),
                  Text(content),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete,
                  color: Color.fromARGB(255, 254, 254, 255), size: 15),
              onPressed: () {},
            )
          ])));
}
