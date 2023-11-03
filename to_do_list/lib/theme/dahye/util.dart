import "package:flutter/material.dart";

Widget addToDoDialog(BuildContext context, Function add) {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  return AlertDialog(
    title: const Text("할 일 추가"),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: titleController,
          decoration: const InputDecoration(
            labelText: "제목",
          ),
        ),
        TextField(
          controller: contentController,
          decoration: const InputDecoration(
            labelText: "내용",
          ),
        ),
      ],
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text("취소"),
      ),
      TextButton(
        onPressed: () {
          add(titleController.text, contentController.text);
          Navigator.pop(context);
        },
        child: const Text("추가"),
      ),
    ],
  );
}
