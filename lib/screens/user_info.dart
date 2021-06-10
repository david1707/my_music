import 'package:flutter/material.dart';

// TODO Display user info (Name, avatar, number of albums on the wishlist + link, number of albums on the collection + link, stats [cheese graph of genres by %])

class UserInfoScreen extends StatelessWidget {
  static const  routeName = '/user-info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('This is the User Info page'),
          ],
        ),
      ),
    );
  }
}
