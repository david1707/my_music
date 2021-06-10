import 'package:flutter/material.dart';

// TODO: A list of albums created by the user
// TODO: FAB/AppBar Icon to add a new album, swipe to delete it (Modal confirmation)

class UserViewListcreen extends StatelessWidget {
  static const  routeName = '/user-view-list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User View List page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('This is the User View List page'),
          ],
        ),
      ),
    );
  }
}
