import 'package:examscheduler/screen/authentication_screen.dart';
import 'package:examscheduler/screen/calendar_screen.dart';
import 'package:examscheduler/screen/list_exam_screen.dart';
import 'package:examscheduler/screen/main_screen.dart';
import 'package:examscheduler/util/global_theme.dart';
import 'package:flutter/material.dart';

import 'data/exam_scheduler_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: globalTheme,
      home: const MyHomePage(title: 'Exam Scheduler'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ExamSchedulerData.title,
      theme: globalTheme,
      routes: {
        AuthenticationScreen.routeName: (ctx) => const AuthenticationScreen(null, null, null),
        ListExamScreen.routeName: (ctx) => ListExamScreen(List.empty()),
        CalendarScreen.routeName: (ctx) => const CalendarScreen(),
      },
      home: const MainScreen()
    );
  }
}
