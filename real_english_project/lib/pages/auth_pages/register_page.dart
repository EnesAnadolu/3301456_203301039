import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_english_project/services/auth_service.dart';
import 'package:real_english_project/pages/auth_pages/login_page.dart';

import '../../widget/dialog.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailCtrl = TextEditingController();
  final passwdCtrl = TextEditingController();
  final nameCtrl = TextEditingController();

  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 7, 181, 216),
              Color.fromARGB(255, 238, 182, 98)
            ])),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Register Page',
                  style: TextStyle(fontSize: 40, fontFamily: 'Pacifico')),
              buildTextField(nameCtrl, 'Name'),
              buildTextField(emailCtrl, 'Email'),
              buildTextField(passwdCtrl, 'Password'),
              MaterialButton(
                onPressed: () {
                  _authService
                      .createPerson(
                      nameCtrl.text, emailCtrl.text, passwdCtrl.text)
                      .then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPage())));
                },
                child: Text('Log in'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: text,
            border: OutlineInputBorder(),
            fillColor: Colors.white.withOpacity(0.1),
            filled: true),
      ),
    );
  }
}

