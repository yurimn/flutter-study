import 'package:flutter/material.dart';
import 'util.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  MenuListState createState() => MenuListState();
}

class MenuListState extends State<MenuList> {
  List listComponent = [
    menuComponent("Flutter HW", "휴지통 기능 추가"),
    menuComponent("Math HW", "전산수학 Ch.7"),
    menuComponent("Bass", "<우리의 꿈> 연습"),
    menuComponent("Study OS", "운영체제 Ch.6"),
  ];

  Widget deleteButton(int index) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("할 일 삭제"),
              content: const Text("삭제하시겠습니까?"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("취소"),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      // 해당 인덱스의 할 일 삭제
                      listComponent.removeAt(index);
                      Navigator.of(context).pop(); // 다이얼로그 닫기
                    });
                  },
                  child: const Text("삭제"),
                ),
              ],
            );
          },
        );
      },
      // style: ElevatedButton.styleFrom(
      //   backgroundColor: Colors.grey,
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(10)),
      //   ),
      // ),
      child: const Icon(Icons.delete, color: Color.fromRGBO(0, 32, 74, 50)),
    );
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
              backgroundColor: Color.fromARGB(250, 254, 190, 73),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            child: Icon(Icons.add, color: Colors.white),
          ));
    }

    List<Widget> menuComponentsWithDeleteButtons = [];

    for (int i = 0; i < listComponent.length; i++) {
      menuComponentsWithDeleteButtons.add(Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: Color.fromARGB(250, 254, 190, 73), width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              listComponent[i],
              deleteButton(i),
            ],
          ),
        ),
      ));
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          addButton(),
          // 할 일 목록과 삭제 버튼을 추가
          ...menuComponentsWithDeleteButtons,
        ],
      ),
    );
  }
}

Widget menuComponent(String title, String content) {
  return Container(
      height: 50,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
          Text(content),
        ],
      ));
}
