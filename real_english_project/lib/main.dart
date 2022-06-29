import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:real_english_project/home.dart';
import 'package:real_english_project/pages/auth_pages/login_page.dart';



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          appId: '1:1084550114908:android:c9d5c594f761475fc00099',
          apiKey: 'AIzaSyA5g6v2rDscj125itEMQf-9AS5zsfqPyZ0',
          messagingSenderId: '1084550114908',
          projectId: 'topics-88189'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        color: Colors.cyan, debugShowCheckedModeBanner: false, home: LoginPage()); //LoginMain());
  }
}
