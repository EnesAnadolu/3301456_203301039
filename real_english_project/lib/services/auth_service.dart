import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String name;

  Future<User?> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  signOut() async {
    return await _auth.signOut();
  }

  Future<User?> createPerson(String name, String email, String password) async {
    final user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore
        .collection('persons')
        .doc('${user.user?.uid}')
        .set({'userName': name, 'email': email, 'password': password});
    return user.user;
  }

  //****************************************************************************************//

  Future createUser({required String email ,required String password ,required String name}) async {

    final user = await _auth
        .createUserWithEmailAndPassword(
        email:email.trim(),
        password: password.trim());

    FirebaseFirestore.instance
        .collection('users')
        .doc('${user.user?.uid}')
        .set({
      'User email': email.trim(),
      'User password': password.trim(),
      'User name': name.trim()
    });
  }

  Future  login({required String email ,required String password}) async{
    await _auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
  }



}
