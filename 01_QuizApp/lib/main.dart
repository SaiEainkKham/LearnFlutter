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
  var questionList = [
    {
      'questionText': 'I like to go outside.',
      'answers': [
        'Yes', 'Sometimes', 'No'
      ]
    },
    {
      'questionText': 'I like to go to party.',
      'answers': [
        'Yes', 'Sometimes', 'No'
      ]
    },
    {
      'questionText': 'I enjoy travelling.',
      'answers': [
        'Yes', 'Sometimes', 'No'
      ]
    },
    {
      'questionText': 'I love to stary at home at weekend',
      'answers': [
        'Yes', 'Sometimes', 'No'
      ]
    },
  ];

  void _answerPressed() {
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: _questionIndex < questionList.length ? 
      Quiz(questionList: questionList, selectHandler: _answerPressed, questionIndex: _questionIndex):
      Result(),
    );
  }
}
