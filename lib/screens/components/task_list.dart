import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/journal_provider.dart';
import '/screens/components/task_tile.dart';

class TaskList extends StatelessWidget {
  /// Since we're using Provider, so we don't need callbacks and parameters
  /// to change the state. Provider does that for us
  // final List<Task> taskList;
  // final Function onCheckboxPress;

  const TaskList({
    super.key,

    /// Since we're using Provider, so we don't need callbacks and parameters
    /// to change the state. Provider does that for us
    // required this.taskList,
    // required this.onCheckboxPress,
  });

  @override
  Widget build(BuildContext context) {
    /// To reduce the burden of writing Provider.of<TasksList>(context).tasks
    /// multiple times in one place, we make use of `Consumer` widget
    /// to make it simpler and easier to access the TasksList
    return Consumer<JournalProvider>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.journalCount,
          itemBuilder: (context, pos) => TaskTile(
            task: taskData.journals[pos],
            onCheckboxPressed: (value) {
              return Provider.of<JournalProvider>(
                context,
                listen: false,
              ).updateTask(value, pos);
            },
            onLongPressed: () {
              taskData.deleteTask(taskData.journals[pos].id!);
            },
          ),
        );
      },
    );
  }
}
