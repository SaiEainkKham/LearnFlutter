import 'package:flutter/material.dart ';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {

  final List<Map<String, Object>> questionList;
  final Function selectHandler;
  final int questionIndex;

  Quiz({required this.questionList, required this.selectHandler, required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Question(
              questionList[questionIndex]['questionText'] as String,
              ),
            ...(questionList[questionIndex]['answers'] as List<Map<String, Object>>)
            .map(
              (answers) {
                return Answer(
                  answerText: answers['text'] as String, 
                  selectHandler: () => selectHandler(answers['Score']),
                  );
              }
            ).toList(),
          ],
        ),
      );
  }
}