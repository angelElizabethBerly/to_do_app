// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:to_do_app/constant/color_constant.dart';
import 'package:to_do_app/controller/home_screen_controller.dart';
import 'package:to_do_app/model/task_model.dart';

class TaskCardWidget extends StatefulWidget {
  const TaskCardWidget(
      {super.key,
      required this.task,
      this.onDelete,
      this.currentKey,
      required this.taskObj});
  final String task;
  final void Function()? onDelete;
  final currentKey;
  final TaskModel taskObj;

  @override
  State<TaskCardWidget> createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends State<TaskCardWidget> {
  IconData? selectedCategory;
  @override
  Widget build(BuildContext context) {
    if (widget.taskObj.category == "1") {
      selectedCategory = Icons.badge;
    } else if (widget.taskObj.category == "2") {
      selectedCategory = Icons.person;
    } else if (widget.taskObj.category == "3") {
      selectedCategory = Icons.food_bank;
    } else {
      selectedCategory = null;
    }
    return ListTile(
      leading: Checkbox(
        value: widget.taskObj.completed,
        onChanged: (value) {
          widget.taskObj.completed = !widget.taskObj.completed;
          HomeScreenController.taskCompleted(widget.currentKey, widget.taskObj);

          setState(() {});
        },
      ),
      title: Row(
        children: [
          Text(widget.task),
          SizedBox(width: 15),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: widget.taskObj.completed == false
                    ? ColorConstant.primaryGrey
                    : ColorConstant.primaryPurple,
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              widget.taskObj.completed == false ? "Incomplete" : "Complete",
              style: TextStyle(
                  color: ColorConstant.primaryWhite,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 5),
          Icon(selectedCategory)
        ],
      ),
      trailing:
          IconButton(onPressed: widget.onDelete, icon: Icon(Icons.delete)),
    );
  }
}
