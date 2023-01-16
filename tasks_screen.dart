import 'package:flutter/material.dart';
import 'package:todoapp/widgets/add_tasks.dart';
import 'package:todoapp/widgets/taskslist.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/main.dart';

class TasksScreen extends StatelessWidget {
  
  const TasksScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const  Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(context: context, builder: (context)=> const AddTasks());
        },
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60, right: 30, left: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const CircleAvatar(backgroundColor: Colors.white,radius: 30,child: Icon(
                  Icons.list,size: 38,color: Colors.lightBlueAccent,),),
                const SizedBox(height: 10,),
                const Text("TODOAPP",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),),
                Text("${Provider.of<Taskdata>(context).tasks.length} tasks",
                style: const  TextStyle(color: Colors.white,fontSize: 15),)
              ],
            ),
          ),
          Expanded(child: Container(
            decoration: const BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
            child: const Padding(
              padding:  EdgeInsets.all(18.0),
              child: TaskList(),
              ),
            ),
          )
        
        ],
      ),
    );
  }
  
}
