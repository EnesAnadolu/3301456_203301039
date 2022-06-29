import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Topic {
  final String image;
  final String topic_title;
  final String content;

  Topic({
    required this.topic_title,
    required this.image,
    required this.content,
  });

  Map<String, dynamic> toJson() => {
        'image': image,
        'topic_title': topic_title,
        'content': content,
      };

  static Topic fromJson(Map<String, dynamic> json) {
    return Topic(
        image: json['image'],
        topic_title: json['topic_title'],
        content: json["content"]);
  }
}
