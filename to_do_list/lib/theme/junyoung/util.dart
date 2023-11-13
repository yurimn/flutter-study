import "package:flutter/material.dart";

Widget addToDoDialog(BuildContext context, Function add) {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  return AlertDialog(
      title: const Text("Add ToDo"),
      content: Form(
        key: formKey,
        child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
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
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, right: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then((value) {
                              if (value != null) {
                                print(value);
                                startTimeController.text =
                                    value.toString().substring(10, 15);
                              }
                            });
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2021),
                                    lastDate: DateTime(2025))
                                .then((value) {
                              if (value != null) {
                                print(value);
                                startDateController.text =
                                    value.toString().substring(0, 10);
                              }
                            });
                          },
                          child: const Text("Start"),
                        ),
                      )),
                  // timepicker
                  SizedBox(
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, left: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then((value) {
                              if (value != null) {
                                print(value);
                                endTimeController.text =
                                    value.toString().substring(10, 15);
                              }
                            });
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2021),
                                    lastDate: DateTime(2025))
                                .then((value) {
                              if (value != null) {
                                print(value);
                                endDateController.text =
                                    value.toString().substring(0, 10);
                              }
                            });
                          },
                          child: const Text("End"),
                        ),
                      )),
                ]),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onPressed: () {
                    int startdate = int.parse(startDateController.text
                        .replaceAll("-", "")
                        .replaceAll(" ", ""));
                    int enddate = int.parse(endDateController.text
                        .replaceAll("-", "")
                        .replaceAll(" ", ""));
                    int starttime =
                        int.parse(startTimeController.text.replaceAll(":", ""));
                    int endtime =
                        int.parse(endTimeController.text.replaceAll(":", ""));
                    print('${startdate}, ${enddate}, ${starttime}, ${endtime}');
                    if (formKey.currentState!.validate()) {
                      if (enddate < startdate ||
                          ((enddate == startdate) && (endtime < starttime))) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Error"),
                                content: const Text(
                                    "End date and time must be later than start date and time"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Close"),
                                  )
                                ],
                              );
                            });
                      } else {
                        add(
                            titleController.text,
                            contentController.text,
                            startDateController.text +
                                " " +
                                startTimeController.text,
                            endDateController.text +
                                " " +
                                endTimeController.text);
                        Navigator.pop(context);
                      }
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
        Text("start : " + content[2]),
        const SizedBox(height: 10),
        Text("end : " + content[3]),
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
