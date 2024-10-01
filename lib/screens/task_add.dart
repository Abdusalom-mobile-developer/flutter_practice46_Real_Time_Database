import 'package:flutter/material.dart';
import 'package:flutter_practice46_realtime_database/config/widgets.dart';

class TaskAddScreen extends StatelessWidget with CustomWidgets {
  static const String id = "/task_add_screen";

  TaskAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _taskTitle = TextEditingController();
    TextEditingController _taskDecription = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.width / 5,
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
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
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.width / 8),
            customTextField(
                context, "Eg: Learn Japanese", "Enter task title", _taskTitle),
            customTextField(context, "Eg: Watch 3 videos of Japanese course",
                "Enter task description", _taskDecription),
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
                        onPressed: () {},
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
