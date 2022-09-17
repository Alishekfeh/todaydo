import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_do/widget/tak_list.dart';

import '../model/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});


  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) =>  ListView.builder(
          itemCount: taskData.tasks.length,
          itemBuilder: (context, index) => TaskList(
            taskTitle:taskData.tasks[index].name,
            isChecked: taskData.tasks[index].isDone,
            checkBoxState: (bool? newValue) {
             taskData.updateData(taskData.tasks[index]);
            },
            deleteList: (){
              taskData.deleteTask(taskData.tasks[index]);
            },
          )
      ),

    );
  }
}
