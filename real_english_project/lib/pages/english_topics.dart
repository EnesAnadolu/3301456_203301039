import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_english_project/pages/manu_page.dart';

class EnglishTopics extends StatefulWidget {
  const EnglishTopics({Key? key}) : super(key: key);

  @override
  State<EnglishTopics> createState() => _EnglishTopicsState();
}

class _EnglishTopicsState extends State<EnglishTopics> with TickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<String> topics = ["Family" , "Animals" , "Jobs" , "Foods" , "Colors"];

  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() =>
    opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            SizedBox(height: 40,),
            animatedLesson('assets/images/family.png', topics[0] , Colors.lightBlueAccent),
            twoLessons(
                animatedLesson('assets/images/dog.png', topics[1], Colors.brown.shade300),
                animatedLesson('assets/images/job.png', topics[2], Colors.orangeAccent)
            ),
            SizedBox(height: 20,),
            twoLessons(
                animatedLesson('assets/images/food.png', topics[3], Colors.deepOrange.shade300),
                animatedLesson('assets/images/paintbox.png', topics[4], Colors.lightBlueAccent)
            ),
            Divider(color: Colors.white,)

          ],
        )
    );
  }

  Widget animatedLesson(String image, String title, Color color){
    double size = 110;
    return GestureDetector(
      onTap: (){
        Get.to(ManuPage(topic: title,));
        _changeOpacity();
      },
      child: Container(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                AnimatedOpacity(
                  opacity: 1,
                  duration: const Duration(seconds: 1),
                child:  AnimatedBuilder(
              animation: _controller,
              child: Container(
                height: size,
                width: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.purple],
                  ),
                ),
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 * pi,
                  child: child,
                );
              },
            )
                  ,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 42,
                  ),
                ),
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(image),
                  //child: Image.asset('assets/images/family_icon.jpg' , fit: BoxFit.fill, height: 50),
                  backgroundColor:color,
                )
              ],
            ),
            Text(title , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18, color: Colors.black45),)
          ],
        ),
      ),
    );
  }

  /*
  Widget lesson(String image, String title,Color color ){
    return GestureDetector(
      onTap:(){
        Get.to(ManuPage());
        _changeOpacity();
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 42,
                  ),
                ),
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(image),
                  //child: Image.asset('assets/images/family_icon.jpg' , fit: BoxFit.fill, height: 50),
                  backgroundColor:color,
                )
              ],
            ),
            Text(title , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18, color: Colors.black45),)
          ],
        ),
      ),
    );
  }*/
}

Widget twoLessons(Widget lesson1, Widget lesson2){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      lesson1,
      SizedBox(width: 20,),
      lesson2
    ],
  );
}

