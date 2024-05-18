import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/model/task.dart';
import 'package:todoey_flutter/util/immutable_list.dart';

/// TaskData was previously used for CRUD operations in List<Task> which was not persistent
/// But after using SQFlite package to persist task data
/// We abandoned this class so as to keep track of
/// how we saved tasks before implementing SQFlite
/// And used `JournalProvider` class so as to keep track of
/// how things are done after implementing SQFlite
class TaskData extends ChangeNotifier {
  /// Made tasks private so that we can't modify it directly
  /// Rather use the getter and setter methods to do so
  final List<Task> _tasks = [];

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
