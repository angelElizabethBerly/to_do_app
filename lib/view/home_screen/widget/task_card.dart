// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:to_do_app/constant/color_constant.dart';
import 'package:to_do_app/controller/home_screen_controller.dart';
import 'package:to_do_app/model/task_model.dart';

class TaskCardWidget extends StatefulWidget {
  const TaskCardWidget({super.key, required this.task, this.onDelete});
  final String task;
  final void Function()? onDelete;

  @override
  State<TaskCardWidget> createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends State<TaskCardWidget> {
  bool checkValue = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: checkValue,
        onChanged: (value) {
          checkValue = !checkValue;
          setState(() {});
        },
      ),
      title: Row(
        children: [
          Text(widget.task),
          SizedBox(width: 20),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: ColorConstant.primaryGrey,
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              "Incomplete",
              style: TextStyle(
                  color: ColorConstant.primaryWhite,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      trailing:
          IconButton(onPressed: widget.onDelete, icon: Icon(Icons.delete)),
    );
  }
}
