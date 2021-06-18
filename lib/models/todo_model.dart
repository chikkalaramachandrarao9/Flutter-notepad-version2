class ToDo {
  String _title;

  ToDo(this._title);

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['title'] = _title;
    return map;
  }

  ToDo.fromMapToObject(Map<String, dynamic> map) {
    this._title = map['title'];
  }
}
