import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:real_english_project/pages/quiz_pages/result_page.dart';
import 'package:real_english_project/widget/option_widget.dart';
import 'package:real_english_project/model/question_model.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({Key? key}) : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late PageController _controller;
  int questionNumber = 1;
  int score = 0;
  bool _isLocked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 32,
          ),
          Text('Question $questionNumber/${questions1.length}'),
          Divider(),
          Expanded(
              child: PageView.builder(
                  itemCount: questions1.length,
                  controller: _controller,
                  itemBuilder: (context, index) {
                    final question = questions1[index];
                    return buildQuestion(question);
                  })),
          _isLocked ? buildElevatedButton() : SizedBox.shrink(),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

  Widget buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 32,
        ),
        Text(
          question.text,
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(
          height: 32,
        ),
        Expanded(
            child: OptionsWidget(
          question: question,
          onClickedOption: (option) {
            if (question.isLocked) {
              return;
            } else {
              setState(() {
                question.isLocked = true;
                question.selectedOption = option;
              });
              _isLocked = question.isLocked;
              if(question.selectedOption!.isCorrect){
                score++;
              }
            }
          },
        ))
      ],
    );
  }


  ElevatedButton buildElevatedButton(){
    return ElevatedButton(onPressed: (){
      if(questionNumber < questions1.length){
        _controller.nextPage(duration: Duration(milliseconds: 250), curve: Curves.easeInExpo);

        setState((){
          questionNumber++;
          _isLocked = false;
        });
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage(score)));
      }

    }, child: Text(
      questionNumber < questions1.length ? 'Next Page' : 'See the Result'
    ));
  }
}
