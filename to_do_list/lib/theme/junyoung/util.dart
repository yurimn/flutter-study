import "package:flutter/material.dart";
import 'junyoung.dart';

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
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text("Add ToDo",
            style: TextStyle(fontFamily: BasicApp.selectedFontFamilly)),
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
                          padding: const EdgeInsets.only(top: 15, right: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now())
                                  .then((value) {
                                if (value != null) {
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
                                  startDateController.text =
                                      value.toString().substring(0, 10);
                                }
                              });
                            },
                            child: Text("Start",
                                style: TextStyle(
                                    fontFamily: BasicApp.selectedFontFamilly)),
                          ),
                        )),
                    // timepicker
                    SizedBox(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, left: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now())
                                  .then((value) {
                                if (value != null) {
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
                                  endDateController.text =
                                      value.toString().substring(0, 10);
                                }
                              });
                            },
                            child: Text("End",
                                style: TextStyle(
                                    fontFamily: BasicApp.selectedFontFamilly)),
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
                      int starttime = int.parse(
                          startTimeController.text.replaceAll(":", ""));
                      int endtime =
                          int.parse(endTimeController.text.replaceAll(":", ""));

                      if (formKey.currentState!.validate()) {
                        if (enddate < startdate ||
                            ((enddate == startdate) && (endtime < starttime))) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Error",
                                      style: TextStyle(
                                          fontFamily:
                                              BasicApp.selectedFontFamilly)),
                                  content: Text(
                                      "End date and time must be later than start date and time",
                                      style: TextStyle(
                                          fontFamily:
                                              BasicApp.selectedFontFamilly)),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Close",
                                          style: TextStyle(
                                              fontFamily: BasicApp
                                                  .selectedFontFamilly)),
                                    )
                                  ],
                                );
                              });
                        } else {
                          widget.add(
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
                    child: Text("Add",
                        style: TextStyle(
                            fontFamily: BasicApp.selectedFontFamilly)),
                  )
                ],
              )),
        ));
  }
}

Widget viewToDoDialog(BuildContext context, List content) {
  return AlertDialog(
    title: Text(content[0],
        style: TextStyle(fontFamily: BasicApp.selectedFontFamilly)),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("content : " + content[1],
            style: TextStyle(fontFamily: BasicApp.selectedFontFamilly)),
        const SizedBox(height: 10),
        Text("start : " + content[2],
            style: TextStyle(fontFamily: BasicApp.selectedFontFamilly)),
        const SizedBox(height: 10),
        Text("end : " + content[3],
            style: TextStyle(fontFamily: BasicApp.selectedFontFamilly)),
      ],
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text("Close",
            style: TextStyle(fontFamily: BasicApp.selectedFontFamilly)),
      )
    ],
  );
}
