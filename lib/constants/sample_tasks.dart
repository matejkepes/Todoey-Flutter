import '/model/task.dart';

final kSampleTaskList = [
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
    taskDescription: "Buy Sleep Medicine",
    isComplete: false,
  ),
  Task(
    taskDescription: "Buy Thyroid Medicine",
    isComplete: true,
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

int countCompletedTasks() {
  var totalCount = 0;
  for (var task in kSampleTaskList) {
    if (task.isComplete) {
      totalCount++;
    }
  }
  return kSampleTaskList.length - totalCount;
}
