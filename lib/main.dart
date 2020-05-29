import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/questionsList.dart';
import 'package:quiz_app/quizPage.dart';

import 'categoryPage.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => CategoryPage(),
        '/second': (context) => QuestionListPage('9'),
      },
    ),
  );
}

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CategoryPage();
  }
}
