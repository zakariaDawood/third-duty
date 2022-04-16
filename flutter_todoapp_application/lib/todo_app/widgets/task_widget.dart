import 'package:flutter/material.dart';
import 'package:flutter_todoapp_application/todo_app/data/tasks_data.dart';
import 'package:flutter_todoapp_application/todo_app/models/task_model.dart';

class TaskWidget extends StatefulWidget {
  Function fun;
  Task task;
  TaskWidget(this.task, this.fun);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: widget.task.isCompleted ? Colors.green : Colors.black45,
            borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              color: Colors.red,
              icon: Icon(Icons.delete),
              onPressed: () {
                tasksList.removeWhere(
                    (element) => element.title == widget.task.title);
                widget.fun();
              },
            ),
            Text(widget.task.title),
            Checkbox(
              value: widget.task.isCompleted,
              onChanged: (value) {
                widget.task.isCompleted = !widget.task.isCompleted;
                setState(() {});
                widget.fun();
              },
            )
          ],
        ),
      ),
    );
  }
}
