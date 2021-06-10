import 'package:flutter/material.dart';

// TODO: Create a new Band (String Description, String Members, id Genre, String From, bool Active, String Photo)

class BandCreateScreen extends StatelessWidget {
  static const  routeName = '/band-create';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Band Create page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('This is the Band Create page'),
          ],
        ),
      ),
    );
  }
}
