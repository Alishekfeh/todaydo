import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_do/model/task_data.dart';


import '../widget/tasks_list.dart';
import 'add_task.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
              isScrollControlled: true,
              context: context, builder: (context)=>

          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddTask(taskCallBack: (newTextAdd){
                // setState(() {
                //   tasks.add(Task(name: newTextAdd));
                //   Navigator.pop(context);
                // });
              }),
            ),
          )
          );
        },
        backgroundColor: Colors.indigo[400],
        child:const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.teal[400],
      body: Container(
        padding:
            const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.playlist_add_check_outlined,
                  size: 20,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "ToDayDO",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ],
            ),
             Text(
              '${Provider.of<TaskData>(context).tasks.length} Tasks',
              style:const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const TasksList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

