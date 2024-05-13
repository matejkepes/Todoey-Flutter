import 'package:flutter/material.dart';
import '/model/task.dart';
import '/screens/components/task_tile.dart';

class TaskList extends StatelessWidget {
  final List<Task> taskList;
  final Function onCheckboxPress;

  const TaskList({
    super.key,
    required this.taskList,
    required this.onCheckboxPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: taskList.length,
      itemBuilder: (context, pos) => TaskTile(
        task: taskList[pos],
        onCheckboxPressed: (value) => onCheckboxPress(pos),
      ),
    );
  }
}
