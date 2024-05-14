import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/model/task_data.dart';
import '../constants/app_constants.dart';
import '/screens/add_task_screen.dart';
import '/screens/components/task_list.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final bool isTaskAvailable = true;
  String newTaskDesc = "";

  /// Since we're using Provider, so we don't need it here
  /// We extracted it to its own data class
  // Sample Task List - I put it here because
  // with task list update all the components that are dependent on it
  // gets automatically updated
  // var sampleTaskList = [
  //   Task(
  //     taskDescription: "Buy Milk",
  //     isComplete: false,
  //   ),
  //   Task(
  //     taskDescription: "Buy Eggs",
  //     isComplete: false,
  //   ),
  //   Task(
  //     taskDescription: "Buy Detergent",
  //     isComplete: true,
  //   ),
  //   Task(
  //     taskDescription: "Buy Sleep Medicine",
  //     isComplete: false,
  //   ),
  //   Task(
  //     taskDescription: "Buy Revolving Chair for Office",
  //     isComplete: false,
  //   ),
  //   Task(
  //     taskDescription: "Go to Post Office",
  //     isComplete: false,
  //   ),
  //   Task(
  //     taskDescription: "Meet Aditi at 24x7 Cafe",
  //     isComplete: false,
  //   ),
  //   Task(
  //     taskDescription: "Attend Office Meeting @ 10:30AM",
  //     isComplete: false,
  //   ),
  // ];

  /// Returns total count of incomplete tasks
  int countRemainingTasks() {
    var totalCount = 0;
    var allTasks = Provider.of<TaskData>(context).tasksList;
    for (var task in allTasks) {
      if (task.isComplete) {
        totalCount++;
      }
    }
    return allTasks.length - totalCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Task Screen Icon
                CircleAvatar(
                  radius: 32.0,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    size: 36.0,
                    color: Colors.blue.shade900,
                  ),
                ),

                /// Task Screen Title Text
                const Text(
                  "Todoey",
                  style: kTaskScreenTitleTextStyle,
                ),

                /// Tasks Remaining Text Widget
                Text(
                  "${countRemainingTasks()} Tasks Remaining",
                  style: kTaskScreenTaskRemainingTextStyle,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: kTaskScreenListContainerDecoration,
              child: Provider.of<TaskData>(context).tasksList.isNotEmpty
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: const TaskList(),
                    )
                  : const Center(child: Text("Welcome to Todoey!")),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue.shade900,
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,

            /// Slides up the bottom sheet on keyboard appearance
            isScrollControlled: true,
            enableDrag: false,
            builder: (context) => const AddTaskScreen(

                /// Since we're using Provider, we don't need these callbacks
                // onValueChanged: (String value) {
                //   setState(() {
                //     newTaskDesc = value;
                //   });
                // },
                // onButtonPressed: () {
                //   // Add Tasks to list
                //   // setState(() {
                //   //   final newTask = Task(
                //   //     taskDescription: newTaskDesc,
                //   //     isComplete: false,
                //   //   );
                //   //   sampleTaskList.add(newTask);
                //   // });
                //
                //   Navigator.pop(context);
                // },
                ),
          );
        },
      ),
    );
  }
}
