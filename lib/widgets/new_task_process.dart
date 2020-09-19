import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
// import 'package:better_uuid/uuid.dart';
// import 'dart:math';

class NewTask extends StatefulWidget {
  final Function addNewTask;

  NewTask(this.addNewTask);
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final titleController = TextEditingController();
  DateTime selectedDate;
 var uuid = Uuid();
//  int  get GetRandomId  
//  {
//  var randomizer = new Random(); // can get a seed as a parameter

//   // Integer between 0 and 100 (0 can be 100 not)
//   var num = randomizer.nextInt(100);
//   return num;
//  }
  
  void datePicker(BuildContext ctx) {
    showDatePicker(
            context: ctx,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((choosenDate) {
      if (choosenDate == null) {
        return;
      }
      setState(() {
        selectedDate = choosenDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        color: Colors.pink[200],
        child: Column(
          children: <Widget>[
            Container(
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
              ),
            ),
            Row(
              children: [
                Container(
                  child: Text(selectedDate == null
                      ? "No Date Choosen"
                      : DateFormat.yMMMEd().format(selectedDate).toString()),
                ),
                Container(
                  child: FlatButton(
                      onPressed: () => datePicker(context),
                      child: Text('Choose Date')),
                )
              ],
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Container(
                child: FlatButton(
                    onPressed: () {
                      widget.addNewTask(
                          uuid.v1(), titleController.text, selectedDate);
                      Navigator.of(context).pop();
                      print('Test Added');
                    },
                    child: Text('Add Your Task')),
              ),
            )
          ],
        ));
  }
}
