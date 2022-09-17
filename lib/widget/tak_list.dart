import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final bool isChecked;

  final String taskTitle;
  final Function(bool?) checkBoxState;
  final Function() deleteList;

  const TaskList({super.key, required this.isChecked,
    required this.taskTitle,
    required this.checkBoxState, required this.deleteList});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(value: isChecked, onChanged: checkBoxState),
      onLongPress: deleteList,
    );
  }

}
