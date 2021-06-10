import 'package:flutter/material.dart';

// TODO: Edit a Band (String Description, String Members, id Genre, String From, bool Active, String Photo)
// TODO: Delete button with confirmation

class BandEditScreen extends StatelessWidget {
  static const  routeName = '/band-edit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Band Edit page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('This is the Band Edit page'),
          ],
        ),
      ),
    );
  }
}
