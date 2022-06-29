import 'package:flutter/material.dart';

class WordPage extends StatelessWidget {
  const WordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Kelimelerle ilgili bilgiler",
          style: TextStyle(fontSize: 200, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
