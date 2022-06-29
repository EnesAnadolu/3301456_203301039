

import 'package:flutter/material.dart';
import 'package:real_english_project/pages/quiz_pages/question_page.dart';

class QuizEntry extends StatelessWidget {
  final String categoryName;
  const QuizEntry({Key? key , required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildQuizMenu(context),
    );
  }

  Widget buildQuizMenu(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "$categoryName Quiz",
              style: TextStyle(
                color: Colors.pinkAccent,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: RawMaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuestionPage()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 24.0),
                child: Text(
                  "Start the quizz ",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              shape: const StadiumBorder(),
              fillColor: Colors.lightBlueAccent,
            ),
          ),
          Center(
            child: Text(
              "Made with Flutter by Enes Anadolu",
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
