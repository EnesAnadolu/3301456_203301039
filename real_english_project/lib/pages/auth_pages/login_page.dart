import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_english_project/services/auth_service.dart';
import 'package:real_english_project/pages/auth_pages/register_page.dart';
import 'package:real_english_project/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController psswdCtrl = TextEditingController();
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
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
              Text('Sign ın Page',
                  style: TextStyle(fontSize: 40, fontFamily: 'Pacifico')),
              buildTextField(emailCtrl , 'Email' , false),
              buildTextField(psswdCtrl , 'Password' , true),
              MaterialButton(
                onPressed: () {
                  _authService.login(email: emailCtrl.text, password: psswdCtrl.text).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home())));
                },
                child: Text('Log in'),
              ),
              MaterialButton(onPressed: (){Get.to(RegisterPage());} , child:Text('Create Account'),)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller , String text , bool isObscure) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: isObscure,
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

/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_english_project/services/auth_service.dart';
import 'package:real_english_project/home.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}
/*
class _SignInPageState extends State<SignInPage> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController psswdCtrl = TextEditingController();
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
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
              Text('Sign ın Page',
                  style: TextStyle(fontSize: 40, fontFamily: 'Pacifico')),
              buildTextField(emailCtrl , 'Email'),
              buildTextField(psswdCtrl , 'Password'),
              MaterialButton(
                onPressed: () {
                  _authService.signIn(emailCtrl.text, psswdCtrl.text).then((value) => Get.to(Home()));
                },
                child: Text('Log in'),
              ),
              MaterialButton(onPressed: (){Get.to(RegisterPage());} , child:Text('Create Account'),)
            ],
          ),
        ),
      ),
    );
  }*/

  Widget buildTextField(TextEditingController controller , String text) {
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
}*/

