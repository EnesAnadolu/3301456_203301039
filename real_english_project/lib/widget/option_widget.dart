

import 'package:flutter/material.dart';
import 'package:real_english_project/model/question_model.dart';

class OptionsWidget extends StatelessWidget {
  final Question question;
  const OptionsWidget({Key? key ,required this.question,required this.onClickedOption }) : super(key: key);
  final ValueChanged<Option> onClickedOption;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: question.options.map((option) => buildOption(context, option)).toList(),
      ),
    );
  }

  Widget buildOption(BuildContext context, Option option){
    final color = getColorForOption(option, question);
    return GestureDetector(
      onTap: ()=> onClickedOption(option),
      child: Container(
        height: 50,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(option.text,style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }

  Color getColorForOption(Option option, Question question){
    final isSelected = option == question.selectedOption;
    if(question.isLocked){
      if(isSelected){
        return option.isCorrect ? Colors.green: Colors.red;
      }
      else if(option.isCorrect){
        return Colors.green;
      }
    }
    return Colors.grey;
  }

}
