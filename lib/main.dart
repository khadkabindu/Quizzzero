import 'package:flutter/material.dart';
import 'package:quiz_app/questionsList.dart';
import 'package:quiz_app/quizPage.dart';

import 'categoryPage.dart';

void main() {
  runApp(Quiz());
}

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuestionListPage('9'),
          ),
        ),
      ),
    );
  }
}
