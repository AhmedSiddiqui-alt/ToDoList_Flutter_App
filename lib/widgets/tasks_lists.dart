import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/empty_task.dart';
import '../models/tasks.dart';

class TasksList extends StatefulWidget {
  final List<Tasks> tasks;
  final Function delTask;
  final Function editTask;
  TasksList(this.tasks, this.delTask, this.editTask);
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  String newTitle = '';
  //  void datePicker(BuildContext ctx) {

  // }

  @override
  Widget build(BuildContext context) {
    return widget.tasks.isEmpty
        ? EmptyTask()
        : Column(
            children: <Widget>[
              // ...tasks.map((task) {

              // }).toList()
              Container(
                  height: 500,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.pink[100],
                                    border: Border.all(
                                        color: Colors.pink[100],
                                        width: 2.0,
                                        style: BorderStyle.solid),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(95))),
                                child: Center(
                                  child: Text(
                                    'Task',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'DancingScript',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Center(
                                      child: Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 15),
                                          child: Text(
                                            widget.tasks[index].title,
                                            style: TextStyle(
                                                fontFamily: 'DancingScript',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          )),
                                      Container(
                                          margin: EdgeInsets.only(left: 15),
                                          child: Text(
                                              DateFormat.yMMMEd().format(
                                                  widget.tasks[index].date),
                                              style: TextStyle(
                                                  fontFamily: 'DancingScript',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)))
                                    ],
                                  ))
                                ],
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: () {
                                            showModalBottomSheet(
                                                context: context,
                                                builder: (_) {
                                                  return Container(
                                                      height: 400,
                                                      color: Colors.pink[200],
                                                      child: Column(
                                                        children: <Widget>[
                                                          Container(
                                                            child:
                                                                TextFormField(
                                                              decoration:
                                                                  InputDecoration(
                                                                      labelText:
                                                                          'Title'),
                                                              initialValue: widget
                                                                  .tasks[index]
                                                                  .title
                                                                  .toString(),
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  newTitle =
                                                                      val;
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                child: Text(DateFormat
                                                                        .yMMMEd()
                                                                    .format(widget
                                                                        .tasks[
                                                                            index]
                                                                        .date)),
                                                              ),
                                                              Container(
                                                                child:
                                                                    FlatButton(
                                                                        onPressed:
                                                                            () =>
                                                                                {
                                                                                  showDatePicker(context: ctx, initialDate: DateTime.now(), firstDate: DateTime(2019), lastDate: DateTime.now()).then((choosenDate) {
                                                                                    if (choosenDate == null) {
                                                                                      return;
                                                                                    }
                                                                                    setState(() {
                                                                                      widget.tasks[index].date = choosenDate;
                                                                                    });
                                                                                  })
                                                                                },
                                                                        child: Text(
                                                                            'Choose Date')),
                                                              )
                                                            ],
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Container(
                                                              child: FlatButton(
                                                                  onPressed:
                                                                      () {
                                                                    widget.editTask(
                                                                        index,
                                                                        widget
                                                                            .tasks[
                                                                                index]
                                                                            .id,
                                                                        newTitle,
                                                                        widget
                                                                            .tasks[index]
                                                                            .date);
                                                                    widget.delTask(widget
                                                                        .tasks[
                                                                            index]
                                                                        .id);

                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    print(
                                                                        'Test Added');
                                                                  },
                                                                  child: Text(
                                                                      'Add Your Task')),
                                                            ),
                                                          )
                                                        ],
                                                      ));
                                                });
                                          }))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () => widget.delTask(
                                              widget.tasks[index].id)))),
                            ],
                          )
                        ],
                      );
                    },
                    itemCount: widget.tasks.length,
                  )),
            ],
          );
  }
}
