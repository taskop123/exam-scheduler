
import 'package:examscheduler/model/user.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class Exam {
  String _subjectName;
  DateTime _dateTime;
  ExamSchedulerUser _owner;
  GeoPoint _location;

  Exam(this._subjectName, this._dateTime, this._owner, this._location);

  ExamSchedulerUser get owner {
    return _owner;
  }

  GeoPoint get location {
    return _location;
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
