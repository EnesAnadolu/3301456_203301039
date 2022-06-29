import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:real_english_project/pages/chart_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double coverHeight = 288;
  double profileHeight = 144;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String name;
  late String email;
  late String about;
  bool textFieldIsOpen = true;
  TextEditingController aboutCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double top = coverHeight - profileHeight / 2;

    return Scaffold(
      extendBodyBehindAppBar: true,
      //extendBody: true,
      //appBar: buildAppBar(context),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Profile"),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(AppUsageChart(title: ''));
              },
              icon: Icon(Icons.access_time_outlined))
        ],
      ),
      body: FutureBuilder(
          future: fetch(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: [
                BuildTop(),
                const SizedBox(height: 40,),
                BuildContent(name, email),
              ],
            );
          }),
    );
  }

  Widget BuildContent(String name, String email) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
          ),
          Text(
            email,
            style: TextStyle(fontSize: 20, color: Colors.black26),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {}, icon: Icon(FontAwesomeIcons.instagram)),
              IconButton(
                  onPressed: () {}, icon: Icon(FontAwesomeIcons.twitter)),
              IconButton(
                  onPressed: () {}, icon: Icon(FontAwesomeIcons.facebook)),
              IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.reddit)),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Divider(color: Colors.black87,),
          const SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "About",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          textFieldIsOpen = !textFieldIsOpen;
                          final docUser = _firestore.collection('persons').doc(_auth.currentUser?.uid);
                          docUser.update({'about' : aboutCtrl.text});
                        });
                      },
                      icon: textFieldIsOpen ?  Icon(FontAwesomeIcons.edit):Icon(Icons.check_circle_outline))
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              textFieldIsOpen
                  ? Text(
                      about,
                    )
                  : TextField(
                maxLines: 8,
                controller: aboutCtrl,
              ),
              SizedBox(height: 40,)
            ],
          ),
        ],
      ),
    );
  }

  Widget BuildTop() {
    double top = coverHeight - profileHeight / 2;
    double bottom = profileHeight / 3;

    return Stack(
      clipBehavior: Clip.none, //Ne işe yarıyor
      alignment: Alignment.center,
      children: [
        Container(margin: EdgeInsets.only(bottom: bottom), child: CoverImage()),
        Positioned(top: top, child: ProfileImage())
      ],
    );
  }

  Widget CoverImage() {
    return Container(
      child: Image.asset(
        'assets/images/bLackground.jpg',
        fit: BoxFit.cover,
      ),
      width: double.infinity,
      height: coverHeight,
    );
  }

  Widget ProfileImage() {
    return CircleAvatar(
      radius: profileHeight / 2,
      backgroundImage: //AssetImage('assets/images/profile.jpg')
          NetworkImage(
              'https://ipe.engin.umich.edu/wp-content/uploads/sites/8/2021/10/360_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg'),
    );
  }

  fetch() async {
    final user = _auth.currentUser;
    if (user != null) {
      ///user != null eğer doğru ise kullanıcı giriş yapmış demektir
      await _firestore.collection('persons').doc(user.uid).get().then((ds) {
        name = ds['userName'];
        email = ds['email'];
        about = ds['about'];
      }).catchError((e) {
        print(e);
      });
    }
  }
}
