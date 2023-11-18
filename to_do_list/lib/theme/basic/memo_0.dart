import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';

class MenuMemo extends StatefulWidget {
  const MenuMemo({Key? key}) : super(key: key);

  @override
  MenuMemoState createState() => MenuMemoState();
}

class MenuMemoState extends State<MenuMemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[300],
        child: DrawingBoard(
          background: Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              color: Colors.white),
          showDefaultActions: true,
          showDefaultTools: true,
        ));
  }
}
