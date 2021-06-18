import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad/main.dart';
import 'package:notepad/models/todo_model.dart';
import 'package:notepad/screens/timetable.dart';
import 'package:notepad/utils/todo_database.dart';
import 'package:sqflite/sqflite.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List<ToDo> list = [];
  DatabaseHelper helper = DatabaseHelper();

  final textcontroller = TextEditingController();

  ToDo todo = ToDo('jaldskf');
  ToDo t = ToDo('g');

  bool a = false;

  Future<void> _newTodo() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user no need to tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'New ToDo',
            style: TextStyle(color: Colors.black),
          ),
//          content: Text(
//            'New ToDo',
//            style: TextStyle(fontSize: 20.0, color: Colors.white),
//          ),

          content: TextField(
            controller: textcontroller,
            decoration: InputDecoration(
              hintText: 'Your ToDo here',
              hintStyle: TextStyle(color: Colors.black, fontSize: 15.0),
              fillColor: Colors.grey[100],
              focusColor: Colors.black,
              filled: true,
            ),
            keyboardType: TextInputType.text,
            maxLines: 1,
            style: TextStyle(color: Colors.black, fontSize: 20.0),
            cursorColor: Colors.black,
            maxLength: 20,
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Discard',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                textcontroller.clear();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                'Save',
                style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
              ),
              onPressed: () {
                helper.insertNote(ToDo(textcontroller.text));
                textcontroller.clear();
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    updateListView();
    var a = new List(list.length);
    for (int i = 0; i < list.length; i++) {
      a[i] = false;
    }
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo'),
        backgroundColor: Colors.black,
      ),
//      body: ListView(
//        children: <Widget>[
//          CheckboxListTile(
//            activeColor: Colors.amber,
//            title: Text(
//              'Hello',
//              style: TextStyle(fontSize: 30.0),
//            ),
//            value: a,
//            onChanged: (bool value) {
//              print('true');
//              setState(() {
//                a = true;
//              });
//            },
//          ),
//        ],
//      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/todo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return CheckboxListTile(
                activeColor: Colors.amber,
                title: Text(
                  list[index].title,
                  style: TextStyle(fontSize: 30.0),
                ),
                value: a[index],
                onChanged: (bool value) {
                  print('true');
                  setState(() {
                    helper.deleteNote(list[index]);
                  });
                },
              );
            }),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Center(
                child: Text(
                  'Hello',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
            ListTile(
              title: Text('My Notes'),
              leading: Icon(Icons.assignment),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
            ),
            ListTile(
              title: Text('ToDo'),
              leading: Icon(Icons.list),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Todo()),
                );
              },
            ),
            ListTile(
              title: Text('Timetable'),
              leading: Icon(Icons.table_chart),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TimeTable()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        child: Icon(
          Icons.add_comment,
          color: Colors.white,
        ),
        onPressed: () {
          _newTodo();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void updateListView() {
    final Future<Database> dbFuture = helper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<ToDo>> noteListFuture = helper.getToDoList();
      noteListFuture.then((list) {
        setState(() {
          this.list = list;
        });
      });
    });
  }
}
