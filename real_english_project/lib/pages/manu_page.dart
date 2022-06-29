import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:real_english_project/pages/my_game/gesture_game.dart';
import 'package:real_english_project/pages/quiz_pages/quiz_entry.dart';

import 'quiz_pages/vocabulary_page.dart';
//import 'package:real_english_project/vocabulary/vocabulary_notebook.dart';

class ManuPage extends StatefulWidget {
  final String topic;
  const ManuPage({Key? key, required this.topic}) : super(key: key);

  @override
  _ManuPageState createState() => _ManuPageState(topic);
}

class _ManuPageState extends State<ManuPage> {
  final String topic;
  _ManuPageState(this.topic);

  double value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Events'),
          centerTitle: true,
        ),
        body: Stack(children: [
          Container(
            child: buildEvents(),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.indigo, Colors.blue])),
          ),
        ]));
  }

  Widget buildEvents() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Event(
              eventName: 'Quiz',
              object: QuizEntry(
                categoryName: topic,
              ),
              description: 'Quiz page'),
          Event(
              eventName: 'Vocabulary Notebook',
              object: VocabularyPage(),
              description: 'Learn english words'),
          Event(
              eventName: 'Gesture Game',
              object: GestureGame(),
              description: 'Word practice with gestures')
          //Event('Word Game' , GamePage())
        ],
      ),
    );
  }

  Widget Event(
      {required String eventName,
      required Widget object,
      required String description}) {
    return GestureDetector(
      onTap: () {
        Get.to(object);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.cyanAccent, borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(5.0),
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                eventName,
                style: TextStyle(fontFamily: 'Pacifico', fontSize: 25),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    description,
                    style: TextStyle(fontFamily: 'OdibeeSans', fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 40,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
