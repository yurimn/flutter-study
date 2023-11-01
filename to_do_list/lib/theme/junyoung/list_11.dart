import 'package:flutter/material.dart';
import 'util.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  MenuListState createState() => MenuListState();
}

class MenuListState extends State<MenuList> {
  List listComponent = [
    menuComponent("2023-10-09", "content1"),
    menuComponent("2023-10-09", "content2"),
    menuComponent("2023-10-09", "content3"),
    menuComponent("2023-10-09", "content4"),
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
              backgroundColor: const Color.fromARGB(255, 130, 130, 130),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ));
    }

    // Widget deleteButton() {
    //   return Padding(
    //       padding: const EdgeInsets.only(left: 6, right: 8),
    //       child: IconButton(
    //         icon: Icon(Icons.delete, color: Color.fromARGB(255, 130, 130, 130)),
    //         onPressed: () {
    //           setState(() {
    //             showDialog(
    //                 context: context,
    //                 builder: (BuildContext context) {
    //                   return addToDoDialog(context,
    //                       (String title, String content) {
    //                     setState(() {
    //                       listComponent.remove(menuComponent(title, content));
    //                     });
    //                   });
    //                 });
    //           });
    //         },
    //       ));
    // }

    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [addButton(), ...listComponent],
        ));
  }
}

Widget deleteButton() {
  return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: IconButton(
        icon: Icon(Icons.delete, color: Color.fromARGB(255, 130, 130, 130)),
        onPressed: () {},
      ));
}

Widget menuComponent(String title, String content) {
  return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: const Color.fromARGB(255, 130, 130, 130), width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 6),
                  child: Text(title,
                      style: const TextStyle(fontWeight: FontWeight.normal)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6, right: 8),
                  child: Text(content,
                      style: const TextStyle(fontWeight: FontWeight.normal)),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(left: 6, right: 8),
                child: deleteButton())
          ],
        ),
      ));
}
