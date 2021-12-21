import 'package:flutter/material.dart';
import 'package:examscheduler/new_exam_form.dart';
import 'package:examscheduler/exam_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
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
  List<ExamClass> _exams = [
    new ExamClass('Веб Базирани Системи', new DateTime(2022, 1, 21, 17, 30)),
    new ExamClass('Системи на знаење', new DateTime(2022, 1, 20, 10, 30)),
    new ExamClass(
        'Мобилни Информациски Системи', new DateTime(2022, 1, 19, 09, 00)),
  ];
  bool _pressed = false;

  void _addNewExamWithArgs(subjectName, dateAndTime) {
    setState(() {
      _exams.add(ExamClass(subjectName, dateAndTime));
      _pressed = !_pressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: () {
              setState(() {
                _pressed = !_pressed;
              });
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          _pressed
              ? NewExamScreen(_addNewExamWithArgs)
              : const Text("To add new Exam, tap the button in the menu"),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _exams.length,
              itemBuilder: (contx, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 5),
                        child: const Text(
                          "Предмет:",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          _exams[index].subjectName,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 5),
                        child: const Text(
                          "Датум и време:",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      Container(
                          child: Text(
                        _exams[index].dateAndTime,
                        style: const TextStyle(fontSize: 14),
                      )),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
