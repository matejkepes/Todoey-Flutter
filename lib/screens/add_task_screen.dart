import 'package:flutter/material.dart';
import '/constants/app_constants.dart';

class AddTaskScreen extends StatelessWidget {
  final Function onButtonPressed;
  final Function onValueChanged;

  const AddTaskScreen({
    super.key,
    required this.onButtonPressed,
    required this.onValueChanged,
  });

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
              onSubmitted: (value) => onButtonPressed(),
              onChanged: (value) => onValueChanged(value),
              autofocus: true,
              decoration: kAddTaskScreenTextFieldInputDecoration,
            ),
            const SizedBox(height: 24.0),

            /// Add Task Button
            MaterialButton(
              height: 50.0,
              color: Colors.blue.shade900,
              onPressed: () => onButtonPressed(),
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
}
