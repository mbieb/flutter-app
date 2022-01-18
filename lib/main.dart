import 'package:flutter/material.dart';

import './question.dart';

import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const questions = [
    {
      'questionText': 'What\'s your favorit color?',
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'questionText': 'What\'s your favorit animal?',
      'answers': ['Fish', 'Bird', 'Dog', 'Cat'],
    },
    {
      'questionText': 'What\'s your favorit Dota Hero?',
      'answers': ['CM', 'Lina', 'Dark Seer', ' Invoker'],
    }
  ];

  var _questionIndex = 0;
  void _aswerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My App"),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(
                    questions[_questionIndex]['questionText'] as String,
                  ),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_aswerQuestion, answer);
                  })
                ],
              )
            : Center(
                child: Text('You did it'),
              ),
      ),
    );
  }
}
