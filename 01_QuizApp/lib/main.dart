import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variable declaration
  int _questionIndex = 0;
  int _totalScore = 0;
  var questionList = [
    {
      'questionText': 'I like to go outside.',
      'answers': [
        {'text': 'Yes', 'Score': 5},
        {'text': 'Sometime', 'Score': 3},
        {'text': 'No', 'Score': 1},
      ]
    },
    {
      'questionText': 'I like to go to party.',
      'answers': [
        {'text': 'Yes', 'Score': 5},
        {'text': 'Sometime', 'Score': 3},
        {'text': 'No', 'Score': 1},
      ]
    },
    {
      'questionText': 'I enjoy travelling.',
      'answers': [
        {'text': 'Yes', 'Score': 5},
        {'text': 'Sometime', 'Score': 3},
        {'text': 'No', 'Score': 1},
      ]
    },
    {
      'questionText': 'I love to stary at home at weekend',
      'answers': [
        {'text': 'Yes', 'Score': 5},
        {'text': 'Sometime', 'Score': 3},
        {'text': 'No', 'Score': 1},
      ]
    },
  ];

  void _answerPressed(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    print(_totalScore);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: _questionIndex < questionList.length ? 
      Quiz(questionList: questionList, selectHandler: _answerPressed, questionIndex: _questionIndex):
      Result(resultScore: _totalScore, selectHandler: _resetQuiz),
    );
  }
}
