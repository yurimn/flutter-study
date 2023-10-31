import 'package:flutter/material.dart';
import 'util.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  MenuListState createState() => MenuListState();
}

class MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    List listComponent = [
      menuComponent(context, "title1", "content1"),
      menuComponent(context, "title2", "content2"),
      menuComponent(context, "title3", "content3"),
      menuComponent(context, "title4", "content4"),
    ];

    Widget addButton() {
      return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                listComponent.add(menuComponent(context, "title5", "content5"));
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

Widget menuComponent(BuildContext context, String title, String content) {
  return Padding(
    padding: const EdgeInsets.only(top: 5),
    child: Container(
      height: 50,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple.shade200, width: 1.5),
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            child: Row(children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 10),
              Text(content),
            ]),
          ),
          const Icon(Icons.delete), // 아이콘 추가
        ],
      ),
    ),
  );
}
