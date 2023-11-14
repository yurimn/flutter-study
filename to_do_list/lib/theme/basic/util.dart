import "package:flutter/material.dart";

class AddToDoDialog extends StatefulWidget {
  const AddToDoDialog({Key? key, required this.add}) : super(key: key);
  final Function add;

  @override
  AddToDoDialogState createState() => AddToDoDialogState();
}

class AddToDoDialogState extends State<AddToDoDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add ToDo"),
      content: Form(
        key: formKey,
        child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: "Title",
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
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter content";
                    }
                    return null;
                  },
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  ElevatedButton(
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2021),
                              lastDate: DateTime(2025))
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            startDateController.text =
                                value.toString().substring(0, 10);
                          });
                        }
                      });
                    },
                    child: const Text("Date"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      child: TextFormField(
                    controller: startDateController,
                    decoration: const InputDecoration(
                      labelText: "Start Date",
                    ),
                    validator: (String? value) {
                      if (value == null ||
                          value.isEmpty ||
                          !RegExp(r"^\d{4}-\d{2}-\d{2}$").hasMatch(value)) {
                        return "Please enter start date";
                      }
                      return null;
                    },
                  ))
                ]),
                Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  ElevatedButton(
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2021),
                              lastDate: DateTime(2025))
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            endDateController.text =
                                value.toString().substring(0, 10);
                          });
                        }
                      });
                    },
                    child: const Text("Date"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      child: TextFormField(
                    controller: endDateController,
                    decoration: const InputDecoration(
                      labelText: "End Date",
                    ),
                    validator: (String? value) {
                      if (value == null ||
                          value.isEmpty ||
                          !RegExp(r"^\d{4}-\d{2}-\d{2}$").hasMatch(value)) {
                        return "Please enter end date";
                      }
                      if (startDateController.text.compareTo(value) > 0) {
                        return "End date must be\nafter start date";
                      }
                      return null;
                    },
                  ))
                ]),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      widget.add(titleController.text, contentController.text,
                          startDateController.text, endDateController.text);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Add"),
                )
              ],
            )),
      ),
    );
  }
}

Widget viewToDoDialog(BuildContext context, List content) {
  return AlertDialog(
    title: Text(content[0]),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("content : " + content[1]),
        const SizedBox(height: 10),
        Text("start date : " + content[2].toString().substring(0, 10)),
        const SizedBox(height: 10),
        Text("end date : " + content[3].toString().substring(0, 10)),
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
