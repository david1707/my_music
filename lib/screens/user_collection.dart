import 'package:flutter/material.dart';

// TODO: List every album on the User Collection (List of IDs). The same filters on Album_list

class UserCollectionScreen extends StatelessWidget {
  static const  routeName = '/user-collection';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Collection page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('This is the User Collection page'),
          ],
        ),
      ),
    );
  }
}
