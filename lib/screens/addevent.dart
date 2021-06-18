import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad/main.dart';

class AddEvent extends StatefulWidget {
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final eventctrl = TextEditingController();

  String dropdownvalueDay;

  List<DropdownMenuItem<String>> menuItemsDay = [
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

  List<DropdownMenuItem<String>> menuItemsTime = [
    DropdownMenuItem(
      child: Text(''),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: eventctrl,
            decoration: InputDecoration(
              hintText: 'Event',
              hintStyle: TextStyle(color: Colors.black, fontSize: 15.0),
              fillColor: Colors.amber,
              focusColor: Colors.black,
              filled: true,
            ),
            keyboardType: TextInputType.text,
            maxLines: 1,
            style: TextStyle(color: Colors.black, fontSize: 20.0),
            cursorColor: Colors.black,
            maxLength: 20,
          ),
          DropdownButton<String>(
            value: dropdownvalueDay,
            hint: Text('Select Day'),
            items: menuItemsDay,
            onChanged: (value) {
              setState(() {
                dropdownvalueDay = value;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
//              DropdownButton<String>(
//                value: dropdownvalue,
//                hint: Text('Select Day'),
//                items: menuItems,
//                onChanged: (value) {
//                  setState(() {
//                    dropdownvalue = value;
//                  });
//                },
//              ),
//              DropdownButton<String>(
//                value: dropdownvalue,
//                hint: Text('Select Day'),
//                items: menuItems,
//                onChanged: (value) {
//                  setState(() {
//                    dropdownvalue = value;
//                  });
//                },
//              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(),
    );
  }
}

//
//Column(
//children: <Widget>[
//Row(
//children: <Widget>[
//Text('Event'),
//TextField(
//controller: eventcntrl,
//decoration: InputDecoration(
//hintText: 'Label',
//fillColor: Colors.teal[900],
//focusColor: Colors.white,
//hintStyle: TextStyle(color: Colors.amber, fontSize: 17.0),
//filled: true,
//),
//keyboardType: TextInputType.text,
//style:
//TextStyle(color: Colors.teal, fontSize: 15.0, height: 2.0),
//cursorColor: Colors.pinkAccent,
//maxLength: 5000,
//),
//],
//),
//Row(
//children: <Widget>[
//Text('Event'),
//DropdownButton<String>(
//value: dropdownvalue,
//hint: Text('Select Day'),
//items: menuItems,
//onChanged: (value) {
//setState(() {
//dropdownvalue = value;
//});
//},
//),
//],
//),
//Row(
//children: <Widget>[
//Text('Event'),
//TextField(
//controller: eventcntrl,
//decoration: InputDecoration(
//hintText: 'Label',
//fillColor: Colors.grey[900],
//focusColor: Colors.white,
//hintStyle: TextStyle(color: Colors.white, fontSize: 17.0),
//filled: true,
//),
//keyboardType: TextInputType.text,
//style:
//TextStyle(color: Colors.white, fontSize: 15.0, height: 2.0),
//cursorColor: Colors.white,
//maxLength: 5000,
//),
//],
//),
//],
//),
