import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../screens/main_screen.dart';
import '../helper/snackbar.dart';

class UserAuth {
  final String email;
  final String password;
  final BuildContext context;
  final String name;

  UserAuth({
    @required this.email,
    @required this.password,
    @required this.context,
    this.name,
  });

  static Future<String> getUser() async {}

  void login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Navigator.of(context).pushNamed(MainScreen.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(
          text: 'No user found for that email.',
          color: Colors.red,
          context: context,
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> registration() async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      userCredential.user.updateDisplayName(this.name);

      print(userCredential.user.uid);

      await FirebaseFirestore.instance.collection('/users').add({
        'displayName': this.name,
        'email': this.email,
        'role': 'user',
        'uid': userCredential.user.uid,
      });

      showSnackBar(
        text: 'Registration successful.',
        color: Colors.green,
        context: context,
      );
      Navigator.of(context).pushNamed(MainScreen.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(
          text: 'The password provided is too weak.',
          color: Colors.red,
          context: context,
        );
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(
          text: 'Email already in use.',
          color: Colors.red,
          context: context,
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
