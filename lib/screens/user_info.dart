import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/user_provider.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';

// TODO Display user info (Name, avatar, number of albums on the wishlist + link, number of albums on the collection + link, stats [cheese graph of genres by %])

class UserInfoScreen extends StatelessWidget {
  static const routeName = '/user-info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'User Info'),
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
            Text(' Philip Jeremiah'),
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/placeholder_avatar.png',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(onPressed: () {}, child: Text('Change avatar')),
            SizedBox(
              height: 10,
            ),
            Text('From: Benidorm, País Valencià.'),
            SizedBox(
              height: 10,
            ),
            Text('Registered since: 24/12/2020.'),
            SizedBox(
              height: 10,
            ),
            Text('Last time online: 15/06/2021.'),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {},
              child: Text('Edit profile'),
            ),
            TextButton(
              onPressed: () {},
              child:
                  Text('Delete profile', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
