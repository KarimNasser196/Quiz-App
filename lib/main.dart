import 'package:flutter/material.dart';
import 'result.dart';
import 'quiz.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

bool isSwitched = false;

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  answerQuestion(int score) {
    print('Answer Chosen!');
    setState(() {
      _questionIndex += 1;
      _totalScore += score;
    });
    print(_questionIndex);
    print(_totalScore);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What\'s the sea color?',
      'answers': [
        {'text': 'Black', 'score': 0},
        {'text': 'Green', 'score': 0},
        {'text': 'Blue', 'score': 1},
        {'text': 'Yellow', 'score': 0},
      ]
    },
    {
      'questionText': 'What\'s the biggest animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 0},
        {'text': 'Tiger', 'score': 0},
        {'text': 'Elephant', 'score': 1},
        {'text': 'Lion', 'score': 0},
      ]
    },
    {
      'questionText': '5 + 1 * 3 = ?',
      'answers': [
        {'text': '15', 'score': 1},
        {'text': '20', 'score': 0},
        {'text': '14', 'score': 0},
        {'text': '17', 'score': 0},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz App',
            style: TextStyle(
                color: isSwitched == false ? Colors.white : Colors.black),
          ),
          actions: [
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeColor: Colors.white,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.black,
            ),
          ],
        ),
        body: Container(
          color: isSwitched == false ? Colors.white : Colors.black,
          child: _questionIndex < _questions.length
              ? Quiz(_questions, _questionIndex, answerQuestion)
              : Result(_resetQuiz, _totalScore),
        ),
      ),
    );
  }
}
