import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../helper/snackbar.dart';
import '../provider/user_provider.dart';
import '../screens/main_screen.dart';

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

  void login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      var data = await FirebaseFirestore.instance.collection('users').where('uid', isEqualTo: userCredential.user.uid).get();
      UserProvider().changeRole(data.docs[0]['role']);

      Navigator.of(context).pushNamed(MainScreen.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(
          text: 'No user found for that email.',
          color: Colors.red,
          context: context,
        );
      } else if (e.code == 'wrong-password') {
        showSnackBar(
          text: 'Wrong password provided for that user.',
          color: Colors.red,
          context: context,
        );
      }
    } catch (e) {
      showSnackBar(
        text: 'Unknown error. Please, contact with the admin.',
        color: Colors.red,
        context: context,
      );
    }
  }

  Future<void> registration() async {
    try {
      await _registerProcess();

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
      showSnackBar(
        text: 'Unknown error. Please, contact with the admin.',
        color: Colors.red,
        context: context,
      );
    }
  }

  Future<void> _registerProcess() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    userCredential.user.updateDisplayName(this.name);

    await FirebaseFirestore.instance.collection('/users').add({
      'displayName': this.name,
      'email': this.email,
      'role': 'user',
      'uid': userCredential.user.uid,
    });

    UserProvider().changeRole('user');
  }
}
