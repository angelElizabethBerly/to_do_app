import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/model/task_model.dart';

class HomeScreenController {
  static List taskListKeys = [];

  static var todoBox = Hive.box<TaskModel>('todoBox');

  static getInitKeys() {
    taskListKeys = todoBox.keys.toList();
  }

  static void addTask(
      {required String task, bool completed = false, String? category}) {
    todoBox
        .add(TaskModel(task: task, completed: completed, category: category));
    taskListKeys = todoBox.keys.toList();
  }

  static Future<void> deleteTask(var key) async {
    await todoBox.delete(key);
    taskListKeys = todoBox.keys.toList();
  }
}
