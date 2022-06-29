
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_english_project/pages/all_notes.dart';
import 'package:real_english_project/pages/file_operations.dart';

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Image(image: AssetImage('assets/images/background.jpg') , fit: BoxFit.fill, height: double.infinity, width: double.infinity,),
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Event(eventName: 'File Operations', object: FileOperations(), description: 'Write to file,read from file'),
            Event(eventName: 'English Notes', object: AllNotes(), description: 'Write to sqlite,read from sqlite')
          ],
        ),]
      ),
    );
  }
  Widget Event({required String eventName,required Widget object ,required String description}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap:(){
          Get.to(object);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10)
          ),
          margin: EdgeInsets.all(5.0),
          height: 100,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left :8.0),
                child: Text(
                  eventName,
                  style: TextStyle(fontFamily: 'Pacifico', fontSize: 25),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left :8.0),
                    child: Text(
                      description,
                      style: TextStyle(fontFamily: 'OdibeeSans',fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:15 ),
                    child: Icon(Icons.arrow_circle_right_outlined , size: 40,),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
