import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad/screens/addevent.dart';
import 'package:notepad/screens/todo.dart';
import '../main.dart';

class TimeTable extends StatefulWidget {
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  String dropdownvalue;

  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(
      child: Text('Monday'),
      value: 'Monday',
    ),
    DropdownMenuItem(
      child: Text('Tuesday'),
      value: 'Tuesday',
    ),
    DropdownMenuItem(
      child: Text('Wednesday'),
      value: 'Wednesday',
    ),
    DropdownMenuItem(
      child: Text('Thursday'),
      value: 'Thursday',
    ),
    DropdownMenuItem(
      child: Text('Friday'),
      value: 'Friday',
    ),
    DropdownMenuItem(
      child: Text('Saturday'),
      value: 'Saturday',
    ),
    DropdownMenuItem(
      child: Text('Sunday'),
      value: 'Sunday',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'TimeTable',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 70,
              child: Center(
                child: DropdownButton<String>(
                  value: dropdownvalue,
                  hint: Text('Select Day'),
                  items: menuItems,
                  onChanged: (value) {
                    setState(() {
                      dropdownvalue = value;
                    });
                  },
                ),
              ),
            ),
            Container(
              child: Text(
                'Require ideas on implementation',
                style: TextStyle(fontSize: 32),
              ),
            ),
          ],
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
          child: Text('Dummy'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddEvent()),
            );
          },
        ),
      ),
    );
  }
}
