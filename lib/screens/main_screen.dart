import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  static const  routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('This is the main page'),
          ],
        ),
      ),
    );
  }
}
