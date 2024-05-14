import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/model/task.dart';
import 'package:todoey_flutter/util/immutable_list.dart';

class TaskData extends ChangeNotifier {
  /// Made tasks private so that we can't modify it directly
  /// Rather use the getter and setter methods to do so
  final List<Task> _tasks = [
    Task(
      taskDescription: "Buy Milk",
      isComplete: false,
    ),
    Task(
      taskDescription: "Buy Eggs",
      isComplete: false,
    ),
    Task(
      taskDescription: "Buy Detergent",
      isComplete: true,
    ),
    Task(
      taskDescription: "Buy Sleep Medicine",
      isComplete: false,
    ),
    Task(
      taskDescription: "Buy Revolving Chair for Office",
      isComplete: false,
    ),
    Task(
      taskDescription: "Go to Post Office",
      isComplete: false,
    ),
    Task(
      taskDescription: "Meet Aditi at 24x7 Cafe",
      isComplete: false,
    ),
    Task(
      taskDescription: "Attend Office Meeting @ 10:30AM",
      isComplete: false,
    ),
  ];

  /// `ImmutableList<T>` is our custom list data structure
  /// to get rid of the .add() method problem
  /// Now, others won't be able to use .add() method that was supplied by
  /// List<T> data structure
  ImmutableList<Task> get tasksList {
    return ImmutableList(_tasks);
  }

  /// getter property to easily get the total item count in the list
  int get taskCount {
    return _tasks.length;
  }

  void addNewTask(String newTaskTitle) {
    Task newTask = Task(taskDescription: newTaskTitle, isComplete: false);
    _tasks.add(newTask);
    notifyListeners();
  }

  /// Toggles the isComplete field value with its opposite
  /// and notifies all the listeners listening to _tasks
  void toggleTaskIsComplete(int pos) {
    Task currentTask = _tasks[pos];
    currentTask.isComplete = !currentTask.isComplete;
    notifyListeners();
  }

  void deleteTask(int pos) {
    _tasks.remove(_tasks[pos]);
    notifyListeners();
  }
}
