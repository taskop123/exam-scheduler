import 'package:examscheduler/model/exam_class.dart';
import 'package:examscheduler/model/user.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class ExamSchedulerData {
  static String title = "Exam Scheduler";
  static List<ExamSchedulerUser> users = [
    ExamSchedulerUser("tashko", "tashko")
  ];
  static List<Exam> exams = [
    Exam('Web Based Systems', DateTime(2022, 4, 21, 17, 30), users[0], GeoPoint(latitude: 42.003902, longitude: 21.409918)),
    Exam('Calculus', DateTime(2022, 4, 20, 10, 30), users[0], GeoPoint(latitude: 42.003902, longitude: 21.409918)),
    Exam(
        'Mobile Information Systems', DateTime(2022, 4, 19, 09, 00), users[0], GeoPoint(latitude: 42.003902, longitude: 21.409918)),
  ];
}