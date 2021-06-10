import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const  routeName = '/sign-up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('This is the sign up page'),
          ],
        ),
      ),
    );
  }
}
