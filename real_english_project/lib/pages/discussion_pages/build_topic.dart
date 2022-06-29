import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_english_project/model/topic_model.dart';

class BuildTopic extends StatefulWidget {
  const BuildTopic({Key? key}) : super(key: key);

  @override
  _BuildTopicState createState() => _BuildTopicState();
}

class _BuildTopicState extends State<BuildTopic> {
  TextEditingController topicCtrl = TextEditingController();
  TextEditingController explnCtrl = TextEditingController();
  TextEditingController imageCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create topic"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          TextField(
            controller: topicCtrl,
            decoration: InputDecoration(
                labelText: 'Topic title', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 15.0,
          ),
          TextField(
            controller: explnCtrl,
            maxLines: 5,
            decoration: InputDecoration(
            labelText: 'Explanation', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 15.0,
          ),
           TextField(
             controller: imageCtrl,
            decoration: InputDecoration(
                labelText: "Image URL", border: OutlineInputBorder()),

          ),
          SizedBox(height: 10,),
          SizedBox(height : 60.0,child: ElevatedButton(
              onPressed: (){
                final topic = Topic(image : imageCtrl.text, topic_title: topicCtrl.text, content: explnCtrl.text);
                createTopic(topic);
                Navigator.pop(context);
              },
              child: Text("Create Topic")))
        ],
      ),
    );
  }

  Future createTopic(Topic topic) async {
    //final topicCollection = FirebaseFirestore.instance.collection('topics').doc().collection('messages');
    final docTopic = FirebaseFirestore.instance.collection('topics').doc();
    await docTopic.set(topic.toJson());
  }
}
