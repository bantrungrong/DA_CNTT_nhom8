import 'package:getxapp/app/data/providers/task/provider.dart';

import '../../models/task.dart';

class TaskReponsitory {
  TaskProvider taskProvider;
  TaskReponsitory ({required this.taskProvider});

  List<Task> readTask() =>  taskProvider.readTasks();
  void writeTask (List<Task> tasks) => taskProvider.writeTasks(tasks);
}