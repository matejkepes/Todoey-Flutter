import 'package:flutter/material.dart';

class Task extends ChangeNotifier {
  String taskDescription;
  bool isComplete;

  Task({
    required this.taskDescription,
    required this.isComplete,
  });

  void toggleDone() {
    isComplete = !isComplete;
    notifyListeners();
  }
}
