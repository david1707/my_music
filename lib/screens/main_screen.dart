import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:badges/badges.dart';

import 'package:firebase_auth/firebase_auth.dart';
class MainScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int totalWishlist = 3;

  @override
  Widget build(BuildContext context) {

    inspect(FirebaseAuth.instance);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
              child: Icon(Icons.favorite, color: Colors.white,),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome YOUR NAME !'),
            SizedBox(height: 50,),
            Text('You have 40 albums in your collection.'),
            SizedBox(height: 10,),
            Text('Click here to view  more albums.'),
            SizedBox(height: 10,),
            Text('More options'),
            SizedBox(height: 10,),
            Text('More options'),
            SizedBox(height: 10,),
            Text('More options'),
          ],
        ),
      ),
    );
  }
}
