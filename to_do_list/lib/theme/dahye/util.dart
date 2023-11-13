import "package:flutter/material.dart";

Widget addToDoDialog(BuildContext context, Function add, Function setState) {
  // title, content, startTime, endTime to be added by textformfield

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

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
                    labelText: "제목",
                    hintText: "제목을 입력하세요",
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
                    hintText: "내용을 입력하세요",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "내용을 입력하세요";
                    }
                    return null;
                  },
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, right: 10),
                        child: OutlinedButton(
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
                          child: const Text("시작"),
                        ),
                      )),
                  SizedBox(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, left: 10),
                        child: OutlinedButton(
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
                          child: const Text("종료"),
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
                    if (formKey.currentState!.validate()) {
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
                      if (enddate < startdate ||
                          ((enddate == startdate) && (endtime < starttime))) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("오류"),
                                content:
                                    const Text("종료 날짜와 시간이 시작 날짜와 시간보다 빠릅니다."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("닫기"),
                                  )
                                ],
                              );
                            });
                      } else {
                        add(
                          titleController.text,
                          contentController.text,
                          '${startDateController.text} ${startTimeController.text}',
                          '${endDateController.text} ${endTimeController.text}',
                        );
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: const Text("추가"),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("내용  " + content[1]),
        const SizedBox(height: 10),
        Text("시작  " + content[2]),
        const SizedBox(height: 10),
        Text("종료  " + content[3]),
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
