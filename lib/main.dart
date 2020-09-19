import 'package:flutter/material.dart';
import 'package:toDoApp/widgets/new_task_process.dart';
import './widgets/tasks_lists.dart';
import './models/tasks.dart';

// import './models/tasks.dart';
// import './widgets/tasks_lists.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.pink[100], backgroundColor: Colors.pink[100]),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _Add_New_Task(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTask(add_New_Task);
        });
  }

  final List<Tasks> tasks = [
    // Tasks(title: 'Update Wifi Device', date: DateTime.now()),
    // Tasks(title: 'Take My Medicines', date: DateTime.now()),
    // Tasks(title: 'Sleep At 10 P.M', date: DateTime.now()),
  ];

  void add_New_Task(var autoId, String newTitle, DateTime newDate) {
    setState(() {
      print(autoId);
      final newtask = Tasks(id: autoId, title: newTitle, date: newDate);
      tasks.add(newtask);
    });
  }

  void editTask(int ind, var idd, String editTitle, DateTime editDate) {
    setState(() {
      final editTask = Tasks(id: idd, title: editTitle, date: editDate);
      print(idd);
      
      tasks.insert(ind, editTask);
    });
  }

  void removeTask(var id) {
    setState(() {
      tasks.removeWhere((randomId) {
        return randomId.id == id ? true : false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add), onPressed: () => _Add_New_Task(context))
        ],
        title: Text(
          'To Do App',
          style: TextStyle(
              fontFamily: 'DancingScript', fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          TasksList(tasks, removeTask, editTask),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink[200],
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () => _Add_New_Task(context),
      ),
    );
  }
}
