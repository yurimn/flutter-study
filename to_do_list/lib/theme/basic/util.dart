import "package:flutter/material.dart";

Widget addToDoDialog(BuildContext context, Function add) {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  return AlertDialog(
      title: const Text("Add ToDo"),
      content: Form(
        key: formKey,
        child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: "Title",
                    hintText: "Enter title",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter title";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: contentController,
                  decoration: const InputDecoration(
                    labelText: "Content",
                    hintText: "Enter content",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter content";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2021),
                              lastDate: DateTime(2025))
                          .then((value) {
                        if (value != null) {
                          print(value);
                        }
                      });
                    },
                    child: const Text("Date"),
                  ),
                ),
                // timepicker
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((value) {
                        if (value != null) {
                          print(value);
                        }
                      });
                    },
                    child: const Text("Time"),
                  ),
                ),

                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      add(titleController.text, contentController.text);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Add"),
                )
              ],
            )),
      ));
}

Widget viewToDoDialog(BuildContext context, List content) {
  return AlertDialog(
    title: Text(content[0]),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("content : " + content[1]),
        const SizedBox(height: 10),
        Text(content[2]),
        const SizedBox(height: 10),
        Text(content[3]),
      ],
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text("Close"),
      )
    ],
  );
}
