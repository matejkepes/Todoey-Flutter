import 'package:flutter/material.dart';

class Task extends ChangeNotifier {
  int? id;
  String taskDescription;
  bool isComplete;
  String? createdAt;

  Task({
    this.id,
    this.createdAt,
    required this.taskDescription,
    required this.isComplete,
  });

  void toggleDone() {
    isComplete = !isComplete;
    notifyListeners();
  }

  Map<String, dynamic> toMap() {
    if (createdAt != null) {
      return {
        'description': taskDescription,
        'isComplete': (isComplete == true) ? 1 : 0,
        'createdAt': createdAt,
      };
    } else {
      return {'description': taskDescription, 'isComplete': isComplete};
    }
  }

  factory Task.fromMap(Map<String, dynamic> mapItem) {
    return Task(
      id: mapItem['id'],
      taskDescription: mapItem['description'],
      isComplete: (mapItem['isComplete'] == 1) ? true : false,
      createdAt: mapItem['createdAt'],
    );
  }
}
