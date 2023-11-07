import 'package:flutter/material.dart';
import 'util.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  MenuListState createState() => MenuListState();
}

class MenuListState extends State<MenuList> {
  List listComponent = [
    ["title1", "content1"],
    ["title2", "content2"],
    ["title3", "content3"],
    ["title4", "content4"]
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
                          listComponent.add([title, content]);
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
        icon: const Icon(Icons.delete, color: Colors.red),
      );
    }

    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            addButton(),
            ListView.builder(
                shrinkWrap: true,
                itemCount: listComponent.length,
                itemBuilder: (BuildContext context, int index) {
                  return menuComponent(
                      listComponent[index],
                      deleteButton(index, () {
                        setState(() {
                          listComponent.removeAt(index);
                        });
                      }));
                })
          ],
        ));
  }
}

Widget menuComponent(List content, Widget deleteButton) {
  return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
          height: 50,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: const Color.fromARGB(255, 130, 130, 130), width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: [
              Text(content[0],
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 10),
              Text(content[1]),
              const Spacer(),
              deleteButton
            ],
          )));
}
