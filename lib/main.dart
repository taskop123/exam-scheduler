import 'package:examscheduler/screen/authentication_screen.dart';
import 'package:examscheduler/screen/calendar_screen.dart';
import 'package:examscheduler/screen/event_location.dart';
import 'package:examscheduler/screen/list_exam_screen.dart';
import 'package:examscheduler/screen/main_screen.dart';
import 'package:examscheduler/screen/map_screen.dart';
import 'package:examscheduler/screen/path_screen.dart';
import 'package:examscheduler/screen/search_page.dart';
import 'package:examscheduler/util/global_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

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
          AuthenticationScreen.routeName: (ctx) =>
              const AuthenticationScreen(null, null, null),
          ListExamScreen.routeName: (ctx) => ListExamScreen(List.empty()),
          CalendarScreen.routeName: (ctx) => const CalendarScreen(),
          MapScreen.routeName: (ctx) => const MapScreen(null),
          SearchScreen.routeName: (ctx) => const SearchScreen(),
          EventLocationScreen.routeName: (ctx) => const EventLocationScreen(),
          PathScreen.routeName: (ctx) => const PathScreen(),
        },
        home: const MainScreen());
  }
}
