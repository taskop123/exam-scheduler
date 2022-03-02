import 'package:examscheduler/model/user.dart';

class Exam {
  String _subjectName;
  DateTime _dateTime;
  ExamSchedulerUser _owner;

  Exam(this._subjectName, this._dateTime, this._owner);

  ExamSchedulerUser get owner {
    return _owner;
  }

  String get subjectName{
    return _subjectName;
  }

  String get dateAndTime{
    return _dateTime.toString();
  }

  DateTime get getDateAndTime{
    return _dateTime;
  }
}
