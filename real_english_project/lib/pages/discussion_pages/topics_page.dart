import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_english_project/pages/discussion_pages/build_topic.dart';
import 'package:real_english_project/pages/discussion_pages/chat_page.dart';
import '../../model/topic_model.dart';
import '../../model/constants.dart';
import '../../widget/topic_card.dart';

class TopicsPage extends StatefulWidget {
  const TopicsPage({Key? key}) : super(key: key);

  @override
  _TopicsPageState createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Discussion area",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(onPressed: () {
          Get.to(BuildTopic());
        }, icon: Icon(Icons.add , color: Colors.black,))],
      ),
      body: StreamBuilder<List<Topic>>(
          stream: readTopics(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              final topics = snapshot.data;
              return ListView(
                children: topics!.map((Topic topic) {
                  return
                      GestureDetector(onTap : (){
                        Get.to(Chat(email: _auth.currentUser?.email ?? ''));
                      },child: TopicCard(image: topic.image, title: topic.topic_title , content: topic.content,));
                }).toList(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Stream<List<Topic>> readTopics() => FirebaseFirestore.instance
      .collection('topics')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Topic.fromJson(doc.data())).toList());
}
