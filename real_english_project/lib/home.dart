import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:real_english_project/pages/all_notes.dart';
import 'package:real_english_project/pages/english_topics.dart';
import 'package:real_english_project/pages/manu_page.dart';
import 'package:real_english_project/pages/profile_page.dart';
import 'package:real_english_project/pages/discussion_pages/topics_page.dart';
import 'package:real_english_project/pages/notes.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selected_index = 0 ;

  final screens = [
    const EnglishTopics(),
    const TopicsPage(),
    const Notes(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selected_index],
      bottomNavigationBar: GNav(
        rippleColor: Colors.black,
        backgroundColor: Colors.white70,
        color: Colors.black,
          gap: 8,
          onTabChange: (index) {
            setState(() {
              selected_index = index;
            });
          },
          tabs: const [
            GButton(icon: FontAwesomeIcons.pencil , text: 'Categories',iconColor: Colors.black45,iconActiveColor: Colors.black ),
            GButton(icon: FontAwesomeIcons.comments , text: 'Discussion',iconColor: Colors.black45,iconActiveColor: Colors.black,),
            GButton(icon: FontAwesomeIcons.noteSticky , text:'Notes',iconColor: Colors.black45,iconActiveColor: Colors.black),
            GButton(icon: CupertinoIcons.person , text : 'Profile',iconColor: Colors.black45,iconActiveColor: Colors.black),
          ]),
    );
  }
}
