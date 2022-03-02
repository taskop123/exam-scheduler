import 'package:examscheduler/data/exam_scheduler_data.dart';
import 'package:examscheduler/model/exam_class.dart';
import 'package:examscheduler/model/user.dart';
import 'package:examscheduler/util/notification_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'authentication_screen.dart';
import 'calendar_screen.dart';
import 'new_exam_form.dart';
import 'list_exam_screen.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen> {
  final String _title = ExamSchedulerData.title;
  final List<Exam> _exams = ExamSchedulerData.exams;
  final List<ExamSchedulerUser> _users = ExamSchedulerData.users;
  bool _pressed = false;
  var _isLogged = false;
  ExamSchedulerUser? _currUser;

  void _addNewExamWithArgs(subjectName, dateAndTime) {
    var newExam = Exam(subjectName, dateAndTime, _currUser!);
    setState(() {
      _exams.add(newExam);
      _pressed = !_pressed;
    });
    NotificationApi.scheduleNotification(newExam);
  }

  bool _login(ExamSchedulerUser user) {
    for (var u in _users) {
      if(u.username == user.username && u.password == user.password) {
        _currUser = user;
        return true;
      }
    }
    return false;
  }

  bool _register(ExamSchedulerUser user) {
    for(var u in _users) {
      if(u.username == user.username && u.password == user.password) {
        return false;
      }
    }
    setState(() {
      _users.add(user);
    });
    return true;
  }

  void _setCurrentUser() {
    setState(() {
      _isLogged = true;
    });
  }

  void _logout(BuildContext context){
    setState(() {
      _currUser = null;
      _isLogged = false;
    });
    NotificationApi.cancelNotifications();
  }

  void _openCalendar(BuildContext context){
    Navigator.of(context)
        .pushNamed(CalendarScreen.routeName, arguments: _exams);
  }

  void _isPressed(BuildContext context) {
    setState(() {
      _pressed = !_pressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    NotificationApi.init();
    NotificationApi.scheduleNotifications(_exams);
    
    return _isLogged ?
      Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(_title),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              return _isPressed(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              return _openCalendar(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              return _logout(context);
            },
          ),
        ],
      ),
      body: Column(
        children:[
          _pressed
                    ? NewExamScreen(_addNewExamWithArgs)
                    : const Text("To add new Exam, tap the button in the menu"),
          Expanded(
            child: ListExamScreen(_exams.where((element) =>
              element.owner.username == _currUser!.username
            ).toList()),
          ),
        ],
      ),
    ) : AuthenticationScreen(_login, _register, _setCurrentUser);
  }

}