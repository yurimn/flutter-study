import "package:flutter/material.dart";

Widget addToDoDialog(BuildContext context, Function add) {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  return AlertDialog(
    title: const Text("Add ToDo"),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: titleController,
          decoration: const InputDecoration(
            labelText: "Title",
          ),
        ),
        TextField(
          controller: contentController,
          decoration: const InputDecoration(
            labelText: "Content",
          ),
        ),
      ],
    ),
    actions: [
      TextButton(
        onPressed: () {
          add(titleController.text, contentController.text);
          Navigator.pop(context);
        },
        child: const Text("Add"),
      ),
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text("Cancel"),
      ),
    ],
  );
}
