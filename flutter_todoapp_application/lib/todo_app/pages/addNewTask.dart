import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todoapp_application/todo_app/data/tasks_data.dart';
import 'package:flutter_todoapp_application/todo_app/models/task_model.dart';
import 'package:flutter_todoapp_application/todo_app/widgets/task_widget.dart';

class addNewTask extends StatefulWidget {
  @override
  State<addNewTask> createState() => _addNewTaskState();
}

class _addNewTaskState extends State<addNewTask> {
  String taskName = '';
  bool isCompleted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Task"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
            onChanged: (value) {
              this.taskName = value;
            },
          ),
          Checkbox(
              value: this.isCompleted,
              onChanged: (value) {
                this.isCompleted = value!;
                setState(() {});
              }),
          RaisedButton(
              child: Text("Add New Task"),
              onPressed: () {
                tasksList.add(Task(this.taskName, this.isCompleted));
                Navigator.pop(context);
              })
        ]),
      ),
    );
  }
}
