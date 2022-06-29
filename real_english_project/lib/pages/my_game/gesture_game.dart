import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GestureGame extends StatefulWidget {
  const GestureGame({Key? key}) : super(key: key);

  @override
  State<GestureGame> createState() => _GestureGameState();
}

class _GestureGameState extends State<GestureGame> {
  int score = 0;
  List<String> animals = ["Horse", "Cat", "Dog", "Bird"];
  List<String> fruit = ["Apple", "Banana", "Watermelon" "Strawberry"];
  List<String> colors = ["Orange", "Yellow", "Green", "Blue"];
  List<String> jobs = ["Doctor", "Teacher", "architect", "tailor"];
  List<String> allWords = [
    "Horse",
    "Cat",
    "Dog",
    "Banana",
    "Watermelon",
    "Strawberry",
    "Orange",
    "Yellow",
    "Green",
    "Doctor",
    "Teacher",
    "architect"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Game'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Center(child: Text('score:$score' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),)),
          )
        ],
      ),
      body: GridView.builder(
        itemCount: allWords.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return buildWord(allWords[index]);
        },
      ),
    );
  }

  Widget buildWord(String word) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: animals.contains(word)
            ? GestureDetector(
                onVerticalDragStart: (DragStartDetails details) {
                  setState(() {
                    score++;
                  });
                },
                child: buildCard(word))
            : colors.contains(word)
                ? GestureDetector(
                    onLongPress: () {
                      setState(() {
                        score++;
                      });
                    },
                    child: buildCard(word))
                : jobs.contains(word)
                    ? GestureDetector(
                        onHorizontalDragStart: (DragStartDetails details) {
                          setState(() {
                            score++;
                          });
                        },
                        child: buildCard(word))
                    : GestureDetector(
                        onDoubleTap: () {
                          setState(() {
                            score++;
                          });
                        },
                        child: buildCard(word)));
  }
  Widget buildCard(String word){
    return Container(
      child: Center(child: Text(word , style: TextStyle(fontSize: 20),)),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.lightBlueAccent
      ),
    );
  }
}
