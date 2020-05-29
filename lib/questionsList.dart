import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Questions>> fetchQuestions(
    http.Client client, String category) async {
  final response = await client.get(
      'https://opentdb.com/api.php?amount=10&category=$category&difficulty=easy&type=boolean');
  return compute(parseQuestions, response.body);
}

List<Questions> parseQuestions(String responseBody) {
  final Map<String, dynamic> response = json.decode(responseBody);
  List<dynamic> results = response['results'];
  return results
      .map((e) => Questions.fromJson(e as Map<String, dynamic>))
      .toList();
}

class Questions {
  final String category;
  final String question;
  final String correct_answer;
  final String incorrect_answer;

  Questions(
      {this.category,
      this.question,
      this.correct_answer,
      this.incorrect_answer});

  factory Questions.fromJson(Map<String, dynamic> json) {
    return Questions(
      category: json['category'] as String,
      question: json['question'] as String,
      correct_answer: json['correct_answer'] as String,
    );
  }
}

class QuestionListPage extends StatelessWidget {
  final String category;

  const QuestionListPage(this.category);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Questions>>(
        future: fetchQuestions(http.Client(), category),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? QuestionsList(questions: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class QuestionsList extends StatelessWidget {
  final List<Questions> questions;

  const QuestionsList({Key key, this.questions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 100.0,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        questions[0].question,
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}