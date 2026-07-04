import 'package:flutter/foundation.dart';

import '../models/task.dart';
import 'fake_data.dart';

class TaskStore extends ChangeNotifier {
  TaskStore._() {
    _tasks.addAll(fakeTasks);
  }

  static final TaskStore instance = TaskStore._();

  final List<Task> _tasks = [];

  List<Task> get tasks => List.unmodifiable(_tasks);

  void addTask(Task task) {
    _tasks.insert(0, task);
    notifyListeners();
  }

  List<Task> tasksForDate(DateTime date) {
    return _tasks.where((task) {
      if (task.dueDate == null) return false;
      return task.dueDate!.year == date.year &&
          task.dueDate!.month == date.month &&
          task.dueDate!.day == date.day;
    }).toList();
  }
}
