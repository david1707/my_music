import 'package:flutter/material.dart';

import 'package:my_music/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';
import '../widgets/custom_appbar.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int totalWishlist = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Home'),
      drawer: Consumer<UserProvider>(
        builder: (context, user, child) {
          if (user?.getRole != null)
            return CustomDrawer(user.getRole);
          else
            return Text('Error: No user detected');
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<UserProvider>(
              builder: (context, user, child) {
                if (user?.getRole != null)
                  return Text('This is your role: ${user.getRole}');
                else
                  return Text('Error: No user detected');
              },
            ),
            Text('Welcome YOUR NAME!'),
            SizedBox(
              height: 50,
            ),
            Text('You have 40 albums in your collection.'),
            SizedBox(
              height: 10,
            ),
            Text('Click here to view  more albums.'),
            SizedBox(
              height: 10,
            ),
            Text('More options'),
            SizedBox(
              height: 10,
            ),
            Text('More options'),
            SizedBox(
              height: 10,
            ),
            Text('More options'),
          ],
        ),
      ),
    );
  }
}
