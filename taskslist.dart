import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/main.dart';
class TaskList extends StatelessWidget {
   
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Consumer<Taskdata>(
      builder: (context, taskdata, child) {
      return ListView.builder(itemBuilder: (context, index){
        return  ListItem(
            tasktext: taskdata.tasks[index].name, 
            ischecked: taskdata.tasks[index].isdone,
            callback: (newvalue){
                 taskdata.updatetask(taskdata.tasks[index]);
                      }, 
            deletecallback:() {
              taskdata.deletetask(taskdata.tasks[index]);
            },
            );
          
      },
      itemCount: taskdata.tasks.length,
      );},
    );
  }
}

class ListItem extends StatelessWidget {
  

   final bool ischecked;
  final String tasktext; 
  final Function(bool?) callback;
  final Function()? deletecallback;
   const ListItem({required this.tasktext,required  this.ischecked,required this.callback,required this.deletecallback, super.key});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title:  Text(tasktext,style: TextStyle(decoration: ischecked ? TextDecoration.lineThrough : null )),
      trailing: Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: ischecked, 
      onChanged: callback,
      ),
      onLongPress: deletecallback,
    );
  }
}
