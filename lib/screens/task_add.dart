import 'package:flutter/material.dart';
import 'package:flutter_practice46_realtime_database/config/widgets.dart';
import 'package:flutter_practice46_realtime_database/screens/home.dart';
import 'package:flutter_practice46_realtime_database/services/CRUD_real_tim_data.dart';

class TaskAddScreen extends StatefulWidget {
  static const String id = "/task_add_screen";

  const TaskAddScreen({super.key});

  @override
  State<TaskAddScreen> createState() => _TaskAddScreenState();
}

class _TaskAddScreenState extends State<TaskAddScreen> with CustomWidgets {
  TextEditingController taskTitle = TextEditingController();
  TextEditingController taskDecription = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.width / 5,
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, HomeScreen.id);
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: MediaQuery.of(context).size.width / 15,
          ),
        ),
        title: Text("Add a task",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 13,
                fontWeight: FontWeight.w600)),
        foregroundColor: Colors.white,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.width / 12),
            customTextField(
                context, "Eg: Learn Japanese", "Enter task title", taskTitle,
                focusNode: _focusNode),
            customTextField(context, "Eg: Watch 3 videos of Japanese course",
                "Enter task description", taskDecription),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width / 6.4,
                    width: MediaQuery.of(context).size.width / 2.4,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(7)),
                    child: TextButton(
                        onPressed: () {
                          DateTime currentDate = DateTime.now();
                          String pmOrAm = "";
                          if (currentDate.hour > 12) {
                            pmOrAm = "PM";
                          } else {
                            pmOrAm = "AM";
                          }
                          if (taskTitle.text.trim().isNotEmpty &&
                              taskDecription.text.trim().isNotEmpty) {
                            CRUDRealTimData.createTask(
                                currentDate.millisecondsSinceEpoch.toString(), {
                              "taskTitle": taskTitle.text.trim(),
                              "taskDecription": taskDecription.text.trim(),
                              "time": currentDate.hour.toString(),
                              "timeAmOrPm": pmOrAm,
                              "id": currentDate.millisecondsSinceEpoch.toString(),
                            });
                            taskTitle.clear();
                            taskDecription.clear();
                            Navigator.pushReplacementNamed(
                                context, HomeScreen.id);
                          } else {
                            taskTitle.clear();
                            taskDecription.clear();
                          }
                          FocusScope.of(context).unfocus();
                        },
                        child: Text("Add",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width / 21,
                                fontWeight: FontWeight.bold))),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
