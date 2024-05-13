import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '/screens/add_task_screen.dart';
import '/screens/components/task_list.dart';
import '/constants/sample_tasks.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final bool isTaskAvailable = true;
  String taskDescription = "";

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
                  "${countCompletedTasks()} Tasks Remaining",
                  style: kTaskScreenTaskRemainingTextStyle,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: kTaskScreenListContainerDecoration,
              child: isTaskAvailable
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TaskList(taskList: kSampleTaskList),
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
            // useSafeArea: true,
            builder: (context) => AddTaskScreen(
              onValueChanged: (String value) {
                setState(() {
                  taskDescription = value;
                });
              },
              onButtonPressed: () {
                // Add Tasks to list
              },
            ),
          );
        },
      ),
    );
  }
}
