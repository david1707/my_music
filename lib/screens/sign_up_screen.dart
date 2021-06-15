import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_music/screens/login_screen.dart';

import '../constants.dart';
import '../helper/snackbar.dart';
import '../widgets/rounded_text_field.dart';

// TODO: Add validation according to Firebase standards
class SignUpScreen extends StatelessWidget {
  static const routeName = '/sign-up';

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _password1Controller = TextEditingController();
  final _password2Controller = TextEditingController();

  void _registerUser(
      {String email, String password, BuildContext context}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      showSnackBar(
        text: 'Registration successful.',
        color: Colors.green,
        context: context,
      );
      Navigator.of(context).pushNamed(LoginScreen.routeName, arguments: {
        'email': email,
        'password': password,
      });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Card(
                child: Column(
                  children: [
                    Text(
                      'Sign up',
                      style: TextStyle(fontSize: kTitleSizeBig),
                    ),
                    SizedBox(
                      height: kSizedBoxLoginSign,
                    ),
                    Text('Fluff text'),
                    SizedBox(
                      height: kSizedBoxLoginSign,
                    ),
                    RoundedTextField(
                      hintText: 'Email',
                      myController: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      isPassword: false,
                    ),
                    SizedBox(
                      height: kSizedBoxLoginSign,
                    ),
                    RoundedTextField(
                      hintText: 'Password',
                      myController: _password1Controller,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                    SizedBox(
                      height: kSizedBoxLoginSign,
                    ),
                    RoundedTextField(
                      hintText: 'Repeat Password',
                      myController: _password2Controller,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_password1Controller.text ==
                            _password2Controller.text) {
                          _registerUser(
                            email: _emailController.text,
                            password: _password1Controller.text,
                            context: context,
                          );
                        } else {
                          showSnackBar(
                            text: 'Both passwords should be the same',
                            color: Colors.red,
                            context: context,
                          );
                        }
                      },
                      child: Text('Sign up'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
