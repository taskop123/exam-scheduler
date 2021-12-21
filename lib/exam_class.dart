class ExamClass {
  String _subjectName;
  DateTime _dateTime;

  ExamClass(this._subjectName, this._dateTime);

  String get subjectName{
    return _subjectName;
  }

  String get dateAndTime{
    return _dateTime.toString();
  }
}
