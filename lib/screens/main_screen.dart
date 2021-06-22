import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_music/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

import '../provider/user_provider.dart';
import '../screens/login_screen.dart';
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
      drawer: Consumer<UserProvider>(
        builder: (context, user, child) {
          if (user?.getRole != null)
            return CustomDrawer(user.getRole);
          else
            return Text('Error: No user detected');
        },
      ),
      appBar: CustomAppBar(
        title: 'Home',
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                totalWishlist++;
              });
            },
            icon: Badge(
              badgeContent: Text(
                totalWishlist.toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamed(LoginScreen.routeName);
            },
            icon: Icon(Icons.logout),
          ),
        ],
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
