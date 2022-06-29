import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_english_project/home.dart';

class ResultPage extends StatefulWidget {
  final int score;
  const ResultPage(this.score, {Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: double.infinity,
              child: Text(
                "Tebrikler",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Text(
            "your score is : ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22.0, color: Colors.white),
          ),
          SizedBox(
            height: 40,
          ),
          Text("${widget.score}",
              style: TextStyle(color: Colors.orange, fontSize: 80)),
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Text("return to menu"),
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
