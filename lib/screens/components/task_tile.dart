import 'package:flutter/material.dart';
import '/model/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function onCheckboxPressed;

  const TaskTile({
    super.key,
    required this.task,
    required this.onCheckboxPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          task.taskDescription,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            decoration: (task.isComplete)
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        Checkbox(
          value: task.isComplete,
          onChanged: (value) => onCheckboxPressed(value),
          checkColor: Colors.white,
          activeColor: Colors.blue.shade900,
        ),
      ],
    );
  }
}
