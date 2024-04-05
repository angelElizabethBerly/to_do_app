import 'package:hive_flutter/adapters.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  String task;
  @HiveField(1)
  bool completed;
  @HiveField(2)
  String? category;

  TaskModel({required this.task, this.completed = false, this.category});
}
