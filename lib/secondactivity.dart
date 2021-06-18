import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad/utils/notes_database.dart';
import 'package:notepad/models/note.dart';

class NoteEditing extends StatefulWidget {
  Note n;

  NoteEditing(this.n);

  @override
  _NoteEditingState createState() => _NoteEditingState(n);
}

class _NoteEditingState extends State<NoteEditing> {
  final titlecontroller = TextEditingController();
  final descontroller = TextEditingController();

  Note note;

  _NoteEditingState(this.note);

  DatabaseHelper helper = DatabaseHelper();

  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirmation',
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            'Do you want to delete?',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          backgroundColor: Colors.grey[900],
          actions: <Widget>[
            FlatButton(
              child: Text(
                'No',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                'Yes',
                style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
              ),
              onPressed: () {
                helper.deleteNote(note);
                Navigator.of(context).pop();
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    descontroller.dispose();
    titlecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (note != null) {
      titlecontroller.text = note.title;
      descontroller.text = note.desc;
    }
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    iconSize: 25.0,
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 0, 5.0),
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    'Note',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _neverSatisfied();
                    },
                    iconSize: 25.0,
                    color: Colors.red,
                    padding: EdgeInsets.fromLTRB(0, 10.0, 20.0, 5.0),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0),
                child: TextField(
                  controller: titlecontroller,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle: TextStyle(color: Colors.white, fontSize: 15.0),
                    fillColor: Colors.grey[900],
                    focusColor: Colors.white,
                    filled: true,
                  ),
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                  cursorColor: Colors.white,
                  maxLength: 60,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                child: TextField(
                  controller: descontroller,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    fillColor: Colors.grey[900],
                    focusColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.white, fontSize: 17.0),
                    filled: true,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 10,
                  style: TextStyle(
                      color: Colors.white, fontSize: 15.0, height: 2.0),
                  cursorColor: Colors.white,
                  maxLength: 5000,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print(titlecontroller.text);
          print(descontroller.text);
          _save(titlecontroller.text, descontroller.text);
        },
        label: Text('Save'),
        icon: Icon(
          Icons.save,
          color: Colors.blue,
        ),
        backgroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void _save(String text, String text2) async {
    if (note == null) {
      Note n = Note(text, text2);
      int res = await helper.insertNote(n);
      print(res);
      if (res != 0) {
        // Success
        print('Status Note Saved Successfully');
        Navigator.pop(context);
      } else {
        // Failure
        print('Status Problem Saving Note');
      }
    } else {
      Note newNote = Note(titlecontroller.text, descontroller.text);
      int res = await helper.updateNote(note, newNote);
      print(res);
      if (res != 0) {
        // Success
        print('Status Note Saved Successfully');
        Navigator.pop(context);
      } else {
        // Failure
        print('Status Problem Saving Note');
      }
    }
  }
}
