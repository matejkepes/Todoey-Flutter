import 'package:flutter/material.dart';
import '/model/task.dart';

class TaskTile extends StatelessWidget {
  /// Although we're using Provider and could do all this without callbacks
  /// and parameters. But we wanted to keep this `TaskTile` widget simpler
  /// so, we went with the callback approach and not Provider approach here
  final Task task;
  final Function onCheckboxPressed;
  final Function onLongPressed;

  const TaskTile({
    super.key,
    required this.task,
    required this.onCheckboxPressed,
    required this.onLongPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => onLongPressed(),
      child: Row(
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
      ),
    );
  }
}
