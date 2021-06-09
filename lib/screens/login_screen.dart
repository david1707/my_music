import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const  routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('This is the login page'),
          ],
        ),
      ),
    );
  }
}
