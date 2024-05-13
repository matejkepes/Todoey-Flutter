import 'package:flutter/material.dart';
import '/model/task.dart';
import '/screens/components/task_tile.dart';

class TaskList extends StatefulWidget {
  final List<Task> taskList;

  const TaskList({
    super.key,
    required this.taskList,
  });

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.taskList.length,
      itemBuilder: (context, pos) => TaskTile(
        task: widget.taskList[pos],
        onCheckboxPressed: () {
          setState(() {
            widget.taskList[pos].toggleDone();
          });
        },
      ),
    );
  }
}
