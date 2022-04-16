import 'package:flutter/material.dart';
import 'package:flutter_todoapp_application/todo_app/data/tasks_data.dart';
import 'package:flutter_todoapp_application/todo_app/models/task_model.dart';
import 'package:flutter_todoapp_application/todo_app/pages/addNewTask.dart';
import 'package:flutter_todoapp_application/todo_app/pages/all_tasks.dart';
import 'package:flutter_todoapp_application/todo_app/pages/complete_tasks.dart';
import 'package:flutter_todoapp_application/todo_app/pages/incomplete_tasks.dart';

class TodoHomePage extends StatefulWidget {
  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  changeTaskCompleteness(Task task) {
    int index = tasksList.indexOf(task);
    tasksList[index].isCompleted = !tasksList[index].isCompleted;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return addNewTask();
                    }));
                  },
                  icon: Icon(Icons.add)),
            ],
            title: const Text('TODO APP'),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.list),
                text: 'All Tasks',
              ),
              Tab(
                icon: Icon(Icons.done),
                text: 'Complete Tasks',
              ),
              Tab(
                icon: Icon(Icons.cancel),
                text: 'InComplete Tasks',
              )
            ]),
          ),
          body: TabBarView(
            children: [
              AllTasksScreen(changeTaskCompleteness),
              CompleteTasksScreen(changeTaskCompleteness),
              InCompleteTasksScreen(changeTaskCompleteness)
            ],
          ),
        ));
  }
}
