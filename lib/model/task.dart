class Task {
  String taskDescription;
  bool isComplete;

  Task({
    required this.taskDescription,
    required this.isComplete,
  });

  void toggleDone() {
    isComplete = !isComplete;
  }
}
