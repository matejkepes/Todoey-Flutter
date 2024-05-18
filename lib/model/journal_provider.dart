import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todoey_flutter/db/sql_helper.dart';
import 'package:todoey_flutter/model/task.dart';
import 'package:todoey_flutter/util/immutable_list.dart';

class JournalProvider with ChangeNotifier {
  /// Made tasks private so that we can't modify it directly
  /// Rather use the getter and setter methods to do so
  List<Task> _journals = [];

  /// `ImmutableList<T>` is our custom list data structure
  /// to get rid of the .add() method problem
  /// Now, others won't be able to use .add() method that was supplied by
  /// List<T> data structure
  ImmutableList<Task> get journals {
    refreshJournals();
    return ImmutableList(_journals);
  }

  /// getter property to easily get the total item count in the list
  int get journalCount {
    return _journals.length;
  }

  Future<void> refreshJournals() async {
    final data = await SQLHelper.getAllItems();
    _journals = data;
    notifyListeners();
  }

  Future<int> addNewTask(String taskDescription) async {
    final id = await SQLHelper.insertItem(
      Task(taskDescription: taskDescription, isComplete: false),
    );
    refreshJournals();
    return id;
  }

  Future<int> updateTask(bool isComplete, int pos) async {
    // Takes the original Task
    Task originalTask = _journals[pos];

    // Modifies the isComplete field's value
    originalTask.isComplete = isComplete;

    // And then sets it in updatedTask variable
    Task updatedTask = originalTask;

    // Which is then passed to the updateTask method of SQLHelper class
    final id = await SQLHelper.updateTask(updatedTask);

    // After updating the data, we refresh the journalList for changes to take effect
    // And since the refreshJournals method already calls notifyListeners()
    // We don't need to call it explicitly
    refreshJournals();
    return id;
  }

  Future<void> deleteTask(int id) async {
    await SQLHelper.deleteTask(id);
    refreshJournals();
  }
}
