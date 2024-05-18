import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/journal_provider.dart';
import '/constants/app_constants.dart';

class AddTaskScreen extends StatefulWidget {
  /// Since we're using Provider, so we don't need these callback functions
  // final Function onButtonPressed;
  // final Function onValueChanged;

  const AddTaskScreen({
    super.key,

    /// Not even these
    // required this.onButtonPressed,
    // required this.onValueChanged,
  });

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTaskTitle = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        /// Used to slide up bottom sheet on keyboard appearance
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: kAddTaskScreenContainerBoxDecoration,
        child: Column(
          /// Used to keep the bottom sheet take the minimum space
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Screen Title Text
            const Center(
              child: Text(
                "Add Task",
                style: kAddTaskScreenTitleTextStyle,
              ),
            ),
            const SizedBox(height: 24.0),

            /// Add Task TextField
            TextField(
              onSubmitted: (value) => addTask(context, newTaskTitle),
              onChanged: (value) => newTaskTitle = value,
              autofocus: true,
              decoration: kAddTaskScreenTextFieldInputDecoration,
            ),
            const SizedBox(height: 24.0),

            /// Add Task Button
            MaterialButton(
              height: 50.0,
              color: Colors.blue.shade900,
              onPressed: () {
                addTask(context, newTaskTitle);
              },
              child: const Text(
                "ADD TASK",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Adds a new task using provider
  void addTask(BuildContext mContext, String taskTitle) {
    Provider.of<JournalProvider>(mContext, listen: false).addNewTask(taskTitle);
    log("AddTaskScreen/New Task Title: $taskTitle");
    Navigator.pop(mContext);
  }
}
