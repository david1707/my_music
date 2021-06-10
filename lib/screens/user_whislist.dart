import 'package:flutter/material.dart';

// TODO: Display albums in the wishlist, delete them, add them to the collection (remove from wishlist, add to collection)

class UserWishListScreen extends StatelessWidget {
  static const  routeName = '/user-wishlist';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User WishList page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('This is the User WishList page'),
          ],
        ),
      ),
    );
  }
}
