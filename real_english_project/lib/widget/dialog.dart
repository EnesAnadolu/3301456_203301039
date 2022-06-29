import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_english_project/pages/auth_pages/login_page.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Container(
        height: 200,
        width: 300,
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: Icon(
                  CupertinoIcons.checkmark_seal_fill,
                  color: Colors.green,
                  size: 60,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green.shade400,
                child: SizedBox.expand(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your account has been successfully created!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Please sign in '),
                      ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));}, child: Text('Sign in'))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
