import 'package:flutter/material.dart';

// TODO: A list of Lists created by the user with their favourites albums
// TODO: FAB/AppBar Icon to create a new one, swipe to delete (Modal confirmation), click to view/edit

class UserListsScreen extends StatelessWidget {
  static const  routeName = '/user-lists';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Lists page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('This is the User Lists page'),
          ],
        ),
      ),
    );
  }
}
