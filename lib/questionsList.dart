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

class QuestionsList extends StatefulWidget {
  final List<Questions> questions;

  QuestionsList({Key key, this.questions}) : super(key: key);

  @override
  _QuestionsListState createState() => _QuestionsListState();
}

class _QuestionsListState extends State<QuestionsList> {
  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.star_border),
              onPressed: () {},
            ),
          ],
        ),
        body: PageView(
          children: <Widget>[
            Center(
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
                                widget.questions[questionNumber].question,
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    questionNumber++;
                                  });
                                },
                                child: Text('True'),
                                color: Colors.green,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    questionNumber++;
                                  });
                                },
                                child: Text('False'),
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
