// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:to_do_app/constant/color_constant.dart';
import 'package:to_do_app/controller/home_screen_controller.dart';
import 'package:to_do_app/view/home_screen/widget/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    HomeScreenController.getInitKeys();
    super.initState();
  }

  TextEditingController taskController = TextEditingController();
  String? dropValue;
  bool isCompleted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        actions: [Icon(Icons.search), SizedBox(width: 10)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Today",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
                SizedBox(width: 5),
                Icon(Icons.sunny)
              ],
            ),
            Column(
              children: List.generate(HomeScreenController.taskListKeys.length,
                  (index) {
                final currentKey = HomeScreenController.taskListKeys[index];
                final currentElement =
                    HomeScreenController.todoBox.get(currentKey);
                return TaskCardWidget(
                  taskObj: currentElement!,
                  currentKey: currentKey,
                  task: currentElement.task,
                  onDelete: () async {
                    await HomeScreenController.deleteTask(currentKey);
                    setState(() {});
                  },
                );
              }),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
        child: TextButton.icon(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(ColorConstant.primaryPurple)),
            onPressed: () {
              taskController.clear();
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: 20,
                        left: 25,
                        right: 25,
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: StatefulBuilder(builder: (BuildContext context,
                        void Function(void Function()) bottomSetState) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Add New Task",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: taskController,
                            decoration: InputDecoration(
                                hintText: "Task",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide())),
                          ),
                          SizedBox(height: 10),
                          DropdownButton(
                            value: dropValue,
                            hint: Text("Select"),
                            items: [
                              DropdownMenuItem(value: "1", child: Text("Work")),
                              DropdownMenuItem(
                                  value: "2", child: Text("Personal")),
                              DropdownMenuItem(value: "3", child: Text("Diet")),
                            ],
                            onChanged: (value) {
                              dropValue = value;

                              bottomSetState(() {});
                            },
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                              onPressed: () {
                                if (taskController.text != "") {
                                  HomeScreenController.addTask(
                                      task: taskController.text,
                                      completed: isCompleted,
                                      category: dropValue);
                                  setState(() {});
                                }
                                Navigator.pop(context);
                              },
                              child: Text("Add"))
                        ],
                      );
                    }),
                  );
                },
              );
            },
            icon: Text(
              "Add a task",
              style: TextStyle(color: ColorConstant.primaryWhite),
            ),
            label: Icon(Icons.add_circle, color: ColorConstant.primaryWhite)),
      ),
    );
  }
}
