class Note {
  String _title;
  String _desc;

  Note(this._title, this._desc);

  String get desc => _desc;

  String get title => _title;

  set note(String value) {
    _desc = value;
  }

  set title(String value) {
    _title = value;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['title'] = _title;
    map['description'] = _desc;
    return map;
  }

  Note.fromMapToObject(Map<String, dynamic> map) {
    this._title = map['title'];
    this._desc = map['description'];
  }
}
