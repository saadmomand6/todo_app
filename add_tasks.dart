import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/main.dart';

class AddTasks extends StatelessWidget {
   const  AddTasks({super.key});
    

  @override
  Widget build(BuildContext context) {
    late String newtasktext;
    return Container(
    color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(18.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("ADD TASK",
            textAlign: TextAlign.center,
            style: TextStyle(
              
              color: Colors.lightBlueAccent,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
              ),
              onChanged: (newvalue) {
                newtasktext = newvalue;       
              },
              
            ),
            const SizedBox(
                  height: 50,
                ),
            ElevatedButton(
              onPressed: (){
                
               Provider.of<Taskdata>(context,listen: false).addTask(newtasktext);         
              Navigator.pop(context);
            }, 
            style:  ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(12),),
              backgroundColor: Colors.blueAccent,

            ), 
            child: const Text("ADD",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),)
          ],
        ),
      ),
    );
  }
}