import 'package:flutter/material.dart';
import 'package:notepad/screens/timetable.dart';
import 'package:notepad/secondactivity.dart';
import 'package:notepad/models/note.dart';
import 'package:notepad/utils/notes_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:notepad/screens/todo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//        backgroundColor: Colors.grey[900],

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text('Notes')),
      ),
      body: ListViewer(),
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
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'New',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NoteEditing(null)),
          );
        },
        icon: Icon(
          Icons.add,
          size: 35.0,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class ListViewer extends StatefulWidget {
  @override
  _ListViewState createState() => _ListViewState();
}

class _ListViewState extends State<ListViewer> {
  DatabaseHelper helper = DatabaseHelper();
  List<Note> list = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    updateListView();
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/back.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 15.0,
              crossAxisCount: 2,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NoteEditing(list[index])),
                    );
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
//                          color: Colors.grey[100 * ((index % 8) + 1)],
//                          color: Colors.white,
                          border: Border.all(
                              color: Colors.grey[800],
                              width: 1.0,
                              style: BorderStyle.solid)),
                      margin: EdgeInsets.all(10.0),
//                        height: 500.0,
//                        alignment: Alignment.center,

                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              list[index].title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              list[index].desc,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )),
                );
              },
              childCount: list.length,
            ),
          ),
        ],
      ),
    );
  }

  void updateListView() {
    final Future<Database> dbFuture = helper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = helper.getNoteList();
      noteListFuture.then((list) {
        setState(() {
          this.list = list;
        });
      });
    });
  }
}
