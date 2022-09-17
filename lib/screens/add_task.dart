import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/task_data.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key, required this.taskCallBack});

  final Function taskCallBack;

  @override
  Widget build(BuildContext context) {
    String? newTextAdd;
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Add Task",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.indigo[400],
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTextAdd = newText;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              Provider.of<TaskData>(context,listen: false).addTask(newTextAdd!);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
                backgroundColor: Colors.teal[400],
                foregroundColor: Colors.white),
            child: const Text(
              "Add",
            ),
          )
        ],
      ),
    );
  }
}
