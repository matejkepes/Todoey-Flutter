import 'package:flutter/material.dart';
import '/constants/app_constants.dart';

class AddTaskScreen extends StatelessWidget {
  final Function onValueChanged;
  final Function onButtonPressed;

  const AddTaskScreen({
    super.key,
    required this.onValueChanged,
    required this.onButtonPressed,
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
            Center(
              child: Text(
                "Add Task",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            const SizedBox(height: 24.0),

            /// Add Task TextField
            TextField(
              onChanged: (value) {},
              autofocus: true,
              decoration: kAddTaskScreenTextFieldInputDecoration,
            ),
            const SizedBox(height: 24.0),

            /// Add Task Button
            MaterialButton(
              height: 50.0,
              color: Colors.blue.shade900,
              onPressed: () {},
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
