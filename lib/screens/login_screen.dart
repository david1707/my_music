import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_music/screens/main_screen.dart';

import '../constants.dart';
import '../helper/snackbar.dart';
import '../widgets/rounded_text_field.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _loginUser({String email, String password, BuildContext context}) async {
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

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    if (args != null &&
        args.containsKey('email') &&
        args.containsKey('password')) {
      _emailController.text = args['email'];
      _passwordController.text = args['password'];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Login page'),
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
                      'Login',
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
                      myController: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        _loginUser(
                          email: _emailController.text,
                          password: _passwordController.text,
                          context: context,
                        );
                      },
                      child: Text('Login'),
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
