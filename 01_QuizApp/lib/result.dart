import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback selectHandler;

  Result({required this.resultScore, required this.selectHandler});

  String get resultPhrase {
    String resultText;
    if (resultScore < 10) {
      resultText = 'You are Introvert!';
    } else if (resultScore < 15) {
      resultText = 'You are Ambivert!';
    } else if (resultScore <= 20) {
      resultText = 'You are Extrovert!';
    } else {
      resultText = 'You did great!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 28, 
              fontStyle: FontStyle.italic, 
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
              ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: selectHandler,
              child: Text('Reset Quiz'),
            ),
          )
        ],
      ),
    );
  }
}
