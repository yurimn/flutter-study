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
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: "제목",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "제목을 입력하세요";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: contentController,
                  decoration: const InputDecoration(
                    labelText: "내용",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "내용을 입력하세요";
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
                    child: const Text("시작"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      child: TextFormField(
                    controller: startDateController,
                    decoration: const InputDecoration(
                      labelText: "시작일",
                    ),
                    validator: (String? value) {
                      if (value == null ||
                          value.isEmpty ||
                          !RegExp(r"^\d{4}-\d{2}-\d{2}$").hasMatch(value)) {
                        return "시작일을 입력하세요";
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
                    child: const Text("종료"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      child: TextFormField(
                    controller: endDateController,
                    decoration: const InputDecoration(
                      labelText: "종료일",
                    ),
                    validator: (String? value) {
                      if (value == null ||
                          value.isEmpty ||
                          !RegExp(r"^\d{4}-\d{2}-\d{2}$").hasMatch(value)) {
                        return "종료일을 입력하세요";
                      }
                      if (startDateController.text.compareTo(value) > 0) {
                        return "종료일은 시작일보다 빠를 수 없습니다";
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
                  child: const Text("추가"),
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
        Text("내용  " + content[1]),
        const SizedBox(height: 10),
        Text("시작일  " + content[2].toString().substring(0, 10)),
        const SizedBox(height: 10),
        Text("종료일 " + content[3].toString().substring(0, 10)),
      ],
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text("닫기"),
      )
    ],
  );
}
