import 'package:flutter/material.dart';
import 'package:quiz_app/questionsList.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 50.0,
        ),
        Center(
          child: Text(
            'Quizzero',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 50.0),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Center(
          child: Text(
            'Select Your category',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              QuestionListPage('9');
            });
          },
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Entertainment',
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: Colors.white),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'General Knowledge',
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: Colors.white),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Science',
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: Colors.white),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(28.0),
              child: Text(
                'History',
                style: TextStyle(fontSize: 15.0),
                textAlign: TextAlign.center,
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: Colors.white),
          ),
        ),
        SizedBox(
          height: 150.0,
        ),
      ],
    );
  }
}
